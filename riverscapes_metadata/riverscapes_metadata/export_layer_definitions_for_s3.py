#!/usr/bin/env python3
"""Flatten unified layer_definitions metadata file(s) into partitioned Parquet (default) files for Athena.

Output pattern:
    dist/metadata/authority=<repo>/authority_name=<name>/tool_schema_version=<version>/layer_metadata.parquet

Index manifest:
    dist/metadata/index.json with partition list + row counts.

Defaults:
    - Format: parquet (use --format csv to get CSV instead)
    - Partition columns (authority, authority_name, tool_schema_version) EXCLUDED from file contents unless --include-partition-cols provided.
    - commit_sha always included (current repo HEAD).
    - No per-row timestamp; generation timestamp stored once in index.json.

Usage examples:
    python export_layer_definitions_for_s3.py
    python export_layer_definitions_for_s3.py --format csv --include-partition-cols

Notes:
    - Scans repository recursively for 'layer_definitions.json'.
    - Single file contains catalog + layer structural definitions.
    - Robust to missing optional fields.
    - Designed for Python >= 3.12 (compatible >=3.10).
    - Parquet writing uses pyarrow.
"""
from __future__ import annotations
import pyarrow.parquet as pq
import pyarrow as pa
import argparse
import csv
import json
import subprocess
import datetime as _dt
from pathlib import Path

from jsonschema import Draft7Validator
from urllib.request import urlopen

from riverscapes_metadata import SCHEMA_URL
# FOR TESTING, can use a different path, e.g. 
# SCHEMA_URL = "https://raw.githubusercontent.com/Riverscapes/RiverscapesXML/refs/heads/layerdefs0.6.1/riverscapes_metadata/schema/layer_definitions.schema.json"

CATALOG_FILENAME = "layer_definitions.json"
OUTPUT_COLUMNS = [  # logical full schema (including partition columns)
    "authority",
    "authority_name",
    "tool_schema_version",
    "layer_id",
    "layer_name",
    "layer_type",
    "layer_path",
    "layer_theme",
    "layer_source_url",
    "layer_data_product_version",
    "layer_description",
    # column-defining fields with prefixes removed
    "name",
    "friendly_name",
    "theme",
    "data_unit",
    "dtype",
    "description",
    "is_key",
    "is_required",
    "default_value",
    # populated by flatten script
    "commit_sha",
]


def git_commit_sha() -> str | None:
    """Return current git commit SHA or None if not available."""
    try:
        sha = subprocess.check_output(["git", "rev-parse", "HEAD"], text=True).strip()
        return sha
    except Exception:
        return None


def find_catalogs(root: Path) -> list[Path]:
    """Find all catalogs in the repository."""
    return [p for p in root.rglob(CATALOG_FILENAME)]


def load_json(path: Path) -> dict:
    """Load JSON from disk."""
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def safe_get(d: dict, key: str, default: str = "") -> str:
    v = d.get(key, default)
    if v is None:
        return default
    return str(v)


def _load_remote_validator() -> Draft7Validator | None:
    """Fetch remote JSON Schema and build validator, returning None on failure."""
    try:
        with urlopen(SCHEMA_URL) as resp:
            schema_data = json.loads(resp.read().decode("utf-8"))
        return Draft7Validator(schema_data)
    except Exception as e:
        print(f"WARNING: Failed to fetch remote schema {SCHEMA_URL}: {e}")
        return None


def flatten_definitions(defs_path: Path, commit_sha: str | None, validator: Draft7Validator | None, errors: list[dict]) -> list[dict]:
    """Flatten a unified layer_definitions.json file into row dicts."""
    data = load_json(defs_path)
    if validator:
        for e in validator.iter_errors(data):
            errors.append({
                "file": str(defs_path),
                "type": "definitions",
                "message": e.message,
                "path": list(e.path)
            })
    authority_name = data.get("authority_name", "")
    tool_schema_version = data.get("tool_schema_version")
    layers = data.get("layers", [])
    rows: list[dict] = []
    for layer in layers:
        layer_id = layer.get("layer_id") or layer.get("layer_name") or ""
        if not layer_id:
            continue
        layer_name = layer.get("layer_name", layer_id)
        layer_type = layer.get("layer_type", "")
        layer_path = layer.get("path", "")
        layer_theme = layer.get("theme", "")
        layer_source_url = layer.get("source_url", "")
        layer_data_product_version = layer.get("data_product_version", "")
        layer_description = layer.get("description", "")
        columns = layer.get("columns", [])
        for col in columns:
            cname = col.get("name", "")
            if not cname:
                continue
            default_val = col.get("default_value")
            # Normalize default_value to simple JSON-compatible scalar or None; store as string for heterogeneity
            if isinstance(default_val, (dict, list)):
                default_val_out = json.dumps(default_val, separators=(",", ":"))
            elif default_val is None:
                default_val_out = None
            else:
                default_val_out = str(default_val)
            rows.append({
                "authority": Path.cwd().name,
                "authority_name": authority_name,
                "tool_schema_version": tool_schema_version,
                "layer_id": layer_id,
                "layer_name": layer_name,
                "layer_type": layer_type,
                "layer_path": layer_path,
                "layer_theme": layer_theme,
                "layer_source_url": layer_source_url,
                "layer_data_product_version": layer_data_product_version,
                "layer_description": layer_description,
                "name": cname,
                "friendly_name": col.get("friendly_name", ""),
                "theme": col.get("theme", ""),
                "data_unit": col.get("data_unit", ""),
                "dtype": col.get("dtype", ""),
                "description": col.get("description", ""),
                "is_key": col.get("is_key", False),
                "is_required": (col.get("is_required") if "is_required" in col else (not col.get("is_nullable", True))),
                "default_value": default_val_out,
                "commit_sha": commit_sha or "",
            })
    return rows


def write_csv(rows: list[dict], output: Path, columns: list[str]) -> None:
    """Write a list of row dicts to CSV with specified columns."""
    output.parent.mkdir(parents=True, exist_ok=True)
    with output.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=columns)
        writer.writeheader()
        for r in rows:
            writer.writerow({k: r.get(k, "") for k in columns})


def write_parquet(rows: list[dict], output: Path, columns: list[str]) -> None:
    """Write rows to Parquet using pyarrow."""
    output.parent.mkdir(parents=True, exist_ok=True)
    # Build Arrow schema dynamically
    field_types = {
        "layer_id": pa.string(),
        "layer_name": pa.string(),
        "layer_type": pa.string(),
    "layer_path": pa.string(),
    "layer_theme": pa.string(),
    "layer_source_url": pa.string(),
    "layer_data_product_version": pa.string(),
        "layer_description": pa.string(),
        "name": pa.string(),
        "friendly_name": pa.string(),
        "data_unit": pa.string(),
        "dtype": pa.string(),
        "description": pa.string(),
        "is_key": pa.bool_(),
        "is_required": pa.bool_(),
        "default_value": pa.string(),
        "commit_sha": pa.string(),
        "authority": pa.string(),
        "authority_name": pa.string(),
        "tool_schema_version": pa.string(),
    }
    pa_fields = [pa.field(c, field_types.get(c, pa.string())) for c in columns]
    data_cols = {c: [r.get(c) for r in rows] for c in columns}
    table = pa.Table.from_pydict(data_cols, schema=pa.schema(pa_fields))
    pq.write_table(table, output)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Flatten layer catalogs into partitioned metadata files for Athena.")
    parser.add_argument("--root", default=str(Path(__file__).resolve().parents[2]), help="Repo root to scan (default: project root).")
    parser.add_argument("--format", choices=["csv", "parquet"], default="parquet", help="Output file format per partition (default parquet).")
    parser.add_argument("--include-partition-cols", action="store_true", help="Include authority, authority_name and tool_schema_version columns inside each file (default: excluded).")
    parser.add_argument("--output", default="dist/metadata", help="Base output directory.")
    return parser.parse_args()


def group_rows(rows: list[dict]) -> dict[tuple[str, str, str], list[dict]]:
    groups: dict[tuple[str, str, str], list[dict]] = {}
    for r in rows:
        key = (r.get("authority", ""), r.get("authority_name", ""), r.get("tool_schema_version", ""))
        groups.setdefault(key, []).append(r)
    return groups


def main() -> None:
    args = parse_args()
    root = Path(args.root).resolve()
    base_output = Path(args.output)
    if not base_output.is_absolute():
        base_output = root / base_output
    commit_sha = git_commit_sha()

    catalogs = find_catalogs(root)
    # Unified validator
    catalog_validator = _load_remote_validator()
    validation_errors: list[dict] = []
    all_rows: list[dict] = []
    for c in catalogs:
        all_rows.extend(flatten_definitions(c, commit_sha=commit_sha, validator=catalog_validator, errors=validation_errors))

    # Loud failure on any validation errors BEFORE writing partition outputs.
    if validation_errors:
        base_output.mkdir(parents=True, exist_ok=True)
        index_path = base_output / "index.json"
        with index_path.open("w", encoding="utf-8") as f:
            json.dump({
                "generated_at": _dt.date.today().isoformat(),
                "commit_sha": commit_sha,
                "partitions": [],
                "total_rows": len(all_rows),
                "validation_errors": validation_errors,
                "status": "validation_failed"
            }, f, indent=2)
        print(f"Validation failed with {len(validation_errors)} error(s). See {index_path}")
        raise SystemExit(1)

    # Partitioned mode only (single-file legacy removed)
    groups = group_rows(all_rows)
    index_manifest = []
    for (repo_auth, auth_name, schema_ver), rows_group in groups.items():
        part_dir = base_output / f"authority={repo_auth}" / f"authority_name={auth_name}" / f"tool_schema_version={schema_ver}"
        columns = OUTPUT_COLUMNS.copy()
        # commit_sha always included
        if not args.include_partition_cols:
            columns = [c for c in columns if c not in {"authority", "authority_name", "tool_schema_version"}]
        out_path = part_dir / ("layer_metadata." + ("parquet" if args.format == "parquet" else "csv"))
        if args.format == "parquet":
            write_parquet(rows_group, out_path, columns)
        else:
            write_csv(rows_group, out_path, columns)
        index_manifest.append({
            "authority": repo_auth,
            "authority_name": auth_name,
            "tool_schema_version": schema_ver,
            "row_count": len(rows_group),
            "path": str(out_path.relative_to(base_output)),
        })

    # Write index.json
    # Index now written to top-level dist/ directory (sibling to metadata/ partitions)
    top_dist = (root / "dist")
    top_dist.mkdir(parents=True, exist_ok=True)
    index_path = top_dist / "index.json"
    with index_path.open("w", encoding="utf-8") as f:
        json.dump({
            "generated_at": _dt.date.today().isoformat(),
            "commit_sha": commit_sha,
            "partitions": index_manifest,
            "total_rows": len(all_rows),
            "validation_errors": [],
            "status": "ok",
            "row_schema_url": SCHEMA_URL,
        }, f, indent=2)
    print(f"Wrote {len(all_rows)} rows across {len(groups)} partitions to {base_output}; index manifest: {index_path}")


if __name__ == "__main__":
    main()
