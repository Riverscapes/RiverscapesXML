#!/usr/bin/env python3
"""Convert a flat CSV export from a spreadsheet into unified layer_definitions.json.

Option set chosen: (1) Manual CSV export + (9) Cutover ceremony.

Spreadsheet expectations (single sheet -> CSV rows):
Columns (header names case-sensitive):
    layer_id, layer_name, layer_type, layer_description,
    column_name, dtype, friendly_name, data_unit, col_description,
    is_key, is_required, theme, preferred_bin_definition, default_value

Authority metadata (authority_name, tool_schema_version) will be provided via CLI flags instead of sheet columns to avoid accidental edits.

Cutover process recommendation:
  1. Team maintains spreadsheet until ready.
  2. Export CSV and run this converter.
  3. Commit generated JSON as canonical source.
  4. Lock the spreadsheet / mark read-only.

Validation:
  - Enforces presence of layer_id, column_name, dtype per row.
  - Aggregates rows into unified structure and validates with jsonschema.
  - Exits non-zero and prints errors if validation fails.

Usage:
  python scripts/metadata/csv_to_layer_definitions.py \
      --csv definitions.csv \
      --authority-name rme_to_athena \
      --tool-schema-version 1.0.0 \
      --out metadata_schemas/layer_definitions.json

"""
from __future__ import annotations
import argparse
import csv
import json
import sys
from urllib.request import urlopen
from pathlib import Path
from jsonschema import Draft7Validator

from riverscapes_metadata import SCHEMA_URL

REQUIRED_ROW_FIELDS = ["layer_id", "column_name", "dtype"]


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(
        description="Convert spreadsheet CSV to layer_definitions.json (validated against remote schema)")
    p.add_argument("--csv", required=True,
                   help="Input CSV export from spreadsheet")
    p.add_argument("--authority-name", required=True,
                   help="Authority name (package/tool identifier)")
    p.add_argument("--tool-schema-version", required=False,
                   help="Tool schema version (semver)")
    p.add_argument("--authority-version", required=False,
                   help="(Deprecated) legacy flag; use --tool-schema-version")
    p.add_argument(
        "--out", default="metadata_schemas/layer_definitions.json", help="Output JSON path")
    return p.parse_args()


def load_rows(csv_path: Path) -> list[dict]:
    with csv_path.open("r", newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        return [dict(r) for r in reader]


def coerce_bool(val: str | None, default: bool) -> bool:
    if val is None or val == "":
        return default
    v = val.strip().lower()
    if v in {"true", "1", "yes", "y"}:
        return True
    if v in {"false", "0", "no", "n"}:
        return False
    return default


def build_definition(authority_name: str, tool_schema_version: str, rows: list[dict]) -> tuple[dict, list[dict]]:
    """Build unified definitions.

    First occurrence of layer-level metadata (layer_name, layer_type, layer_description) wins.
    Subsequent rows with conflicting non-empty values are ignored and recorded as conflicts.
    """
    layers: dict[str, dict] = {}
    conflicts: list[dict] = []
    for r in rows:
        if not any(v.strip() for v in r.values() if isinstance(v, str)):
            continue
        missing = [fld for fld in REQUIRED_ROW_FIELDS if not r.get(fld)]
        if missing:
            raise ValueError(f"Row missing required fields {missing}: {r}")
        lid = r["layer_id"].strip()
        # Capture raw values before applying fallbacks so we only treat genuinely provided non-empty values as potential conflicts.
        raw_layer_name = (r.get("layer_name") or "").strip()
        raw_desc = (r.get("layer_description") or "").strip()
        raw_type = (r.get("layer_type") or "").strip()
        # Fallbacks (blank layer_name falls back to layer_id; other fields remain blank if missing)
        new_layer_name = raw_layer_name or lid
        new_desc = raw_desc
        new_type = raw_type
        if lid not in layers:
            layers[lid] = {
                "layer_id": lid,
                "layer_name": new_layer_name,
                "description": new_desc,
                "layer_type": new_type,
                "columns": []
            }
        else:
            existing = layers[lid]
            # Only record a conflict if the raw (explicit) value is non-empty and differs; ignore fallback-derived values.
            if raw_layer_name and raw_layer_name != existing["layer_name"]:
                conflicts.append({"layer_id": lid, "field": "layer_name",
                                 "kept": existing["layer_name"], "ignored": raw_layer_name})
            if raw_desc and raw_desc != existing["description"]:
                conflicts.append({"layer_id": lid, "field": "description",
                                 "kept": existing["description"], "ignored": raw_desc})
            if raw_type and raw_type != existing["layer_type"]:
                conflicts.append({"layer_id": lid, "field": "layer_type",
                                 "kept": existing["layer_type"], "ignored": raw_type})
        layers[lid]["columns"].append({
            "name": r["column_name"].strip(),
            "dtype": r["dtype"].strip(),
            "friendly_name": (r.get("friendly_name") or "").strip(),
            "data_unit": (r.get("data_unit") or "").strip(),
            "description": (r.get("col_description") or "").strip(),
            "is_key": coerce_bool(r.get("is_key"), False),
            "is_required": coerce_bool(r.get("is_required"), False),
            "theme": (r.get("theme") or "").strip(),
            "preferred_bin_definition": (r.get("preferred_bin_definition") or "").strip(),
            "default_value": (r.get("default_value") or None),
        })
    return ({
        "$schema": SCHEMA_URL,
        "authority_name": authority_name,
        "tool_schema_version": tool_schema_version,
        "layers": list(layers.values())
    }, conflicts)


def validate(defs: dict) -> None:
    try:
        with urlopen(SCHEMA_URL) as resp:
            schema = json.loads(resp.read().decode("utf-8"))
    except Exception as e:
        print(
            f"Failed to fetch remote schema {SCHEMA_URL}: {e}", file=sys.stderr)
        sys.exit(3)
    Draft7Validator(schema).validate(defs)


def main() -> None:
    args = parse_args()
    csv_path = Path(args.csv)
    if not csv_path.exists():
        print(f"CSV not found: {csv_path}", file=sys.stderr)
        sys.exit(2)
    rows = load_rows(csv_path)
    tool_schema_version = args.tool_schema_version
    if not tool_schema_version:
        print("Missing required --tool-schema-version", file=sys.stderr)
        sys.exit(2)
    defs, conflicts = build_definition(
        args.authority_name, tool_schema_version, rows)
    try:
        validate(defs)
    except Exception as e:
        print(f"Validation failed: {e}", file=sys.stderr)
        # Pretty-print partial for debugging if small
        preview = json.dumps(defs, indent=2)[:1000]
        print("-- JSON Preview (truncated) --\n" + preview, file=sys.stderr)
        sys.exit(1)
    out_path = Path(args.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(defs, indent=2), encoding="utf-8")
    print(f"Wrote unified layer definitions JSON: {out_path}")
    if conflicts:
        print(
            f"NOTE: {len(conflicts)} metadata conflict(s) detected (first occurrence kept):", file=sys.stderr)
        for c in conflicts[:10]:
            print(
                f"  layer_id={c['layer_id']} field={c['field']} kept='{c['kept']}' ignored='{c['ignored']}'", file=sys.stderr)
        if len(conflicts) > 10:
            print(f"  ... {len(conflicts)-10} more", file=sys.stderr)


if __name__ == "__main__":
    main()
