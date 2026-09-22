#!/usr/bin/env python3
"""QGIS .qml to Riverscapes JSON Web Symbology converter.

Handles all vector renderer types (graduatedSymbol, singleSymbol,
categorizedSymbol, RuleRenderer), geometry types (line/fill/marker), both
<Option> and <prop> QML attribute formats, translucent colours, and
<range>/<category> labels. Raster layers and layers without geometry are
skipped, not failed.

Usage:
  python QML2WebSymbology.py [--diff]          # coverage report (default)
  python QML2WebSymbology.py --dir STREAMTEMP   # convert one sub-dir
  python QML2WebSymbology.py --dir X --out Y    # convert to custom output
  python QML2WebSymbology.py --all              # convert all sub-dirs
  python QML2WebSymbology.py --all --out DIR    # base dir, sub-dirs nested inside
  python QML2WebSymbology.py --missing          # convert only sub-dirs with missing JSONs

Options:
  --force     overwrite existing JSON files
  --validate  validate each output against Symbology/web/vector.schema.json
              (requires the jsonschema package)
"""
from __future__ import annotations

import argparse
import json
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Any


SCHEMA_URL = "https://xml.riverscapes.xyz/Symbology/web/vector.schema.json"
EPSILON = 0.0001
_DEFAULT_COLOR = "rgb(128,128,128)"
_GEOMS = ("line", "fill", "marker")
# <layerGeometryType> fallback: 0=point 1=line 2=polygon (3/4=unknown/null)
_LGT_GEOM = {"0": "circle", "1": "line", "2": "fill"}

_SCRIPT_DIR = Path(__file__).resolve().parent
QGIS_ROOT = _SCRIPT_DIR.parent / "Symbology" / "qgis"
WEB_ROOT = _SCRIPT_DIR.parent / "Symbology" / "web"


# -------------------------------------------------------------------
# Colour helpers
# -------------------------------------------------------------------


def _qcolor(raw: str | None) -> str | None:
    """Convert a QGIS R,G,B,A colour to an rgb()/rgba() string.

    Returns None when the colour is absent or fully transparent
    (alpha 0): there is nothing to paint.
    """
    if not raw:
        return None
    parts = [p.strip() for p in raw.split(",")]
    try:
        r, g, b = (int(p) for p in parts[:3])
        a = int(parts[3]) if len(parts) > 3 else 255
    except ValueError:
        return None
    if a <= 0:
        return None
    if a < 255:
        return "rgba({},{},{},{})".format(r, g, b, round(a / 255, 3))
    return "rgb({},{},{})".format(r, g, b)


# -------------------------------------------------------------------
# QML attribute extraction
# -------------------------------------------------------------------


def _options(el: ET.Element) -> dict[str, str]:
    """First-wins {name: value} dict of every <Option>/<prop> under el.

    A symbol's own layer options precede any nested data-defined-property
    options in document order, so first-wins selects the real values.
    """
    opts: dict[str, str] = {}
    for child in el.iter():
        if child.tag == "Option":
            key, val = child.get("name"), child.get("value")
        elif child.tag == "prop":
            key, val = child.get("k"), child.get("v")
        else:
            continue
        if key and val and key not in opts:
            opts[key] = val
    return opts


def _symbol_color(opts: dict[str, str], sym_type: str) -> str | None:
    if sym_type == "line":
        # legacy (QGIS 2.x-era) line symbols store the colour in "color"
        return _qcolor(opts.get("line_color")) or _qcolor(opts.get("color"))
    color = _qcolor(opts.get("color"))
    if color:
        return color
    if sym_type == "marker":  # marker without fill: fall back to outline
        return _qcolor(opts.get("line_color"))
    return None


def _symbol_outline(opts: dict[str, str], fill_color: str | None) -> tuple:
    """(colour, width) of a fill/marker symbol's outline, or (None, None).

    Modern symbols use outline_color/outline_width; legacy outline-only
    polygon symbols carry the boundary in line_color/line_width instead.
    """
    if opts.get("outline_style") == "no":
        return None, None
    oc = _qcolor(opts.get("outline_color"))
    if oc is not None:
        return oc, _num_width(opts, "outline_width", 0.2)
    lc = _qcolor(opts.get("line_color"))
    if lc is not None:
        return lc, _num_width(opts, "line_width", 1.0)
    if fill_color is not None:
        return fill_color, 0.2
    return None, None


def _num_width(opts: dict[str, str], key: str, default: float) -> float:
    try:
        return float(opts.get(key, str(default)))
    except ValueError:
        return default


def _geom_of(sym_type: str) -> str:
    return "circle" if sym_type == "marker" else sym_type


def _fmt(v: float) -> str:
    return "{:g}".format(v)


# -------------------------------------------------------------------
# QML parsing
# -------------------------------------------------------------------


def _symbol_table(renderer: ET.Element | None) -> dict[str, dict[str, Any]]:
    """Symbols from the renderer's <symbols> collection, keyed by name.

    Scoped to <symbols> so a graduated renderer's <source-symbol> (which
    reuses name="0") cannot clobber the real range symbols.
    """
    syms: dict[str, dict[str, Any]] = {}
    if renderer is None:
        return syms
    coll = renderer.find("symbols")
    if coll is None:
        return syms
    for sym in coll.findall("symbol"):
        name, stype = sym.get("name"), sym.get("type")
        if name is None or stype not in _GEOMS:
            continue
        syms[name] = {"type": stype, "opts": _options(sym)}
    return syms


def parse_qml(text: str, file_path: str) -> dict[str, Any]:
    result: dict[str, Any] = {
        "attr": "",
        "geometry_type": None,
        "renderer_type": "",
        "ranges": [],
        "categories": [],
        "rules": [],
        "single_symbol": None,
    }

    root = ET.fromstring(text)
    renderer = root.find("renderer-v2")
    syms: dict[str, dict[str, Any]] = {}
    if renderer is not None:
        result["renderer_type"] = renderer.get("type") or ""
        attr_raw = renderer.get("attr") or ""
        # QGIS wraps field names containing special characters in quotes
        if len(attr_raw) >= 2 and attr_raw[0] == '"' and attr_raw[-1] == '"':
            attr_raw = attr_raw[1:-1]
        result["attr"] = attr_raw
        syms = _symbol_table(renderer)

    # Geometry type: first renderer symbol, then rule inline symbols,
    # then the layer's <layerGeometryType>.
    if syms:
        result["geometry_type"] = _geom_of(next(iter(syms.values()))["type"])
    else:
        rules_el = renderer.find("rules") if renderer is not None else None
        if rules_el is not None:
            for rule in rules_el.iter("rule"):
                inline = rule.find("symbol")
                if inline is not None and inline.get("type") in _GEOMS:
                    result["geometry_type"] = _geom_of(inline.get("type"))
                    break
    if result["geometry_type"] is None:
        lgt = (root.findtext("layerGeometryType") or "").strip()
        result["geometry_type"] = _LGT_GEOM.get(lgt)

    # singleSymbol
    if result["renderer_type"] == "singleSymbol":
        entry = next(iter(syms.values()), None)
        if entry is not None:
            color = _symbol_color(entry["opts"], entry["type"])
            ss: dict[str, Any] = {
                "type": entry["type"],
                "color": color,
                "line_width": _num_width(entry["opts"], "line_width", 1.0),
                "label": Path(file_path).stem.replace("_", " ").replace("-", " "),
            }
            if entry["type"] in ("fill", "marker"):
                ss["outline"], ss["outline_width"] = _symbol_outline(
                    entry["opts"], color)
            result["single_symbol"] = ss

    # categorizedSymbol
    elif result["renderer_type"] == "categorizedSymbol":
        cats_el = renderer.find("categories")
        if cats_el is not None:
            for cat in cats_el.findall("category"):
                value = cat.get("value") or ""
                entry = syms.get(cat.get("symbol") or "0")
                color = _symbol_color(entry["opts"], entry["type"]) if entry else None
                result["categories"].append({
                    "value": value,
                    "label": cat.get("label") or value,
                    "color": color,
                })

    # RuleRenderer
    elif result["renderer_type"] == "RuleRenderer":
        rules_el = renderer.find("rules")
        if rules_el is not None:
            # iter() catches nested (group) rules in document order
            for rule in rules_el.iter("rule"):
                color: str | None = None
                inline = rule.find("symbol")
                if inline is not None and inline.get("type") in _GEOMS:
                    color = _symbol_color(_options(inline), inline.get("type"))
                else:
                    entry = syms.get(rule.get("symbol") or "")
                    if entry:
                        color = _symbol_color(entry["opts"], entry["type"])
                result["rules"].append({
                    "label": rule.get("label") or "",
                    "filter": rule.get("filter") or "",
                    "color": color,
                })

    # graduatedSymbol
    elif result["renderer_type"] == "graduatedSymbol":
        ranges_el = renderer.find("ranges")
        if ranges_el is not None:
            for rg in ranges_el.findall("range"):
                lo_s, hi_s = rg.get("lower"), rg.get("upper")
                sym = rg.get("symbol")
                if lo_s is None or hi_s is None or sym is None:
                    continue
                try:
                    lo, hi = float(lo_s), float(hi_s)
                except ValueError:
                    continue
                entry = syms.get(sym)
                opts = entry["opts"] if entry else {}
                stype = entry["type"] if entry else "line"
                label = rg.get("label") or ""
                if not label:
                    label = "{} - {}".format(_fmt(lo), _fmt(hi))
                result["ranges"].append({
                    "lower": lo,
                    "upper": hi,
                    "label": label,
                    "color": _symbol_color(opts, stype),
                    "line_width": _num_width(opts, "line_width", 1.0),
                })
            result["ranges"].sort(key=lambda r: r["lower"])

    return result


# ===================================================================
# JSON generation (Mapbox GL style)
# ===================================================================


def _r6(v: float) -> float:
    return round(v, 6)


def _num(v: Any) -> Any:
    """Category value for a Mapbox match: int, then float, then string."""
    try:
        return int(v)
    except (TypeError, ValueError):
        pass
    try:
        return float(v)
    except (TypeError, ValueError):
        pass
    return v


def _range_stops(ranges: list[dict], value_at) -> list:
    """[val, stop, val, stop, ...] for a Mapbox interpolate over ranges.

    Each range holds its value from its lower bound to EPSILON below the
    next range's lower bound. A zero-width range (e.g. the "exactly 0"
    category common in these layers) owns its single value; the next range
    starts at lower + EPSILON. A final pass enforces strictly increasing
    input values, which Mapbox GL requires (duplicates invalidate the
    style); at a shared boundary the later range wins.
    """
    raw: list[tuple[float, Any]] = []
    n = len(ranges)
    prev_lo: float | None = None
    for i, r in enumerate(ranges):
        lo, hi = _r6(r["lower"]), _r6(r["upper"])
        if lo == prev_lo:  # zero-width predecessor: start just after it
            lo = _r6(lo + EPSILON)
        prev_lo = _r6(r["lower"])
        raw.append((lo, value_at(r, i)))
        if i < n - 1:
            nx = _r6(ranges[i + 1]["lower"])
            eps = _r6(nx - EPSILON)
            if nx > lo and eps >= lo:
                raw.append((eps, value_at(r, i)))
        elif hi > lo:
            raw.append((hi, value_at(r, i)))
    flat: list = []
    for val, stop in raw:
        if flat and val <= flat[-2]:
            if val == flat[-2]:
                flat[-1] = stop  # shared boundary: later range wins
            continue  # non-increasing input: drop (defensive)
        flat.extend([val, stop])
    return flat


def _line_width_expr(rng: list[dict], attr: str):
    """Static width when all ranges agree, data expression otherwise."""
    widths = [r["line_width"] for r in rng]
    if all(w == widths[0] for w in widths):
        return widths[0]
    return ["interpolate", ["linear"], ["get", attr]] + \
        _range_stops(rng, lambda r, i: r["line_width"])


def _has_alpha(v: Any) -> bool:
    """True when a colour value (string or expression) carries its own alpha."""
    if isinstance(v, str):
        return v.startswith("rgba")
    if isinstance(v, list):
        return any(isinstance(x, str) and x.startswith("rgba") for x in v)
    return False


def _make_layer(lid: str, typ: str, sl: str, paint: dict) -> dict:
    return {
        "id": lid,
        "type": typ,
        "source": "composite",
        "source-layer": sl,
        "layout": {},
        "paint": paint,
    }


def build_json(parsed: dict[str, Any], qml_filename: str) -> dict | None:
    rt = parsed["renderer_type"]
    geom = parsed["geometry_type"]
    attr = parsed["attr"]
    if geom not in ("line", "fill", "circle"):
        return None
    sid = Path(qml_filename).stem
    sl = attr or sid
    layers: list[dict] = []

    def gl(typ, paint):
        # ids must be unique per style: one id per layer type
        layers.append(_make_layer("{}-{}".format(sid, typ), typ, sl, paint))

    def interp() -> list:
        return ["interpolate", ["linear"], ["get", attr]]

    # --- singleSymbol ---
    if rt == "singleSymbol":
        s = parsed.get("single_symbol")
        if not s:
            return None
        c = s.get("color")
        outline = s.get("outline")
        if c is None and not (geom == "fill" and outline):
            return None
        if geom == "fill":
            legend = [[c or outline, s.get("label") or sid]]
            if c is not None:
                fp = {"fill-color": c}
                if not _has_alpha(c):
                    fp["fill-opacity"] = 0.6
                gl("fill", fp)
            if outline:
                lp = {"line-color": outline, "line-width": s.get("outline_width", 0.2)}
                if not _has_alpha(outline):
                    lp["line-opacity"] = 0.8
                gl("line", lp)
        elif geom == "line":
            if c is None:
                return None
            legend = [[c, s.get("label") or sid]]
            gl("line", {"line-color": c, "line-width": s.get("line_width", 1)})
        elif geom == "circle":
            if c is None:
                return None
            legend = [[c, s.get("label") or sid]]
            cp = {"circle-color": c, "circle-radius": 4}
            if not _has_alpha(c):
                cp["circle-opacity"] = 0.8
            gl("circle", cp)
        else:
            return None
        return {"$schema": SCHEMA_URL, "legend": legend, "layerStyles": layers}

    # --- categorizedSymbol ---
    if rt == "categorizedSymbol":
        cats = [c for c in parsed["categories"] if c.get("color")]
        if not cats:
            return None
        legend = [[c["color"], c.get("label") or c["value"]] for c in cats]
        mx = ["match", ["get", attr]]
        for c in cats:
            mx.extend([_num(c["value"]), c["color"]])
        mx.append(_DEFAULT_COLOR)
        if geom == "fill":
            fp = {"fill-color": mx}
            if not _has_alpha(mx):
                fp["fill-opacity"] = 0.7
            gl("fill", fp)
            gl("line", {"line-color": "rgba(0,0,0,0.2)", "line-width": 0.2})
        elif geom == "line":
            gl("line", {"line-color": mx, "line-width": 1})
        elif geom == "circle":
            cp = {"circle-color": mx, "circle-radius": 4}
            if not _has_alpha(mx):
                cp["circle-opacity"] = 0.8
            gl("circle", cp)
        else:
            return None
        return {"$schema": SCHEMA_URL, "legend": legend, "layerStyles": layers}

    # --- RuleRenderer ---
    if rt == "RuleRenderer":
        rules = parsed["rules"]
        if not rules:
            return None
        # The web schema has no per-rule filters, so only one colour can be
        # painted; use the first rule that has a visible colour.
        color = next((r["color"] for r in rules if r["color"]), None)
        if color is None:
            return None
        legend = [[r["color"] or _DEFAULT_COLOR, r["label"]] for r in rules]
        if geom == "fill":
            fp = {"fill-color": color}
            if not _has_alpha(color):
                fp["fill-opacity"] = 0.6
            gl("fill", fp)
            gl("line", {"line-color": "rgba(0,0,0,0.2)", "line-width": 0.2})
        elif geom == "line":
            gl("line", {"line-color": color, "line-width": 1})
        elif geom == "circle":
            cp = {"circle-color": color, "circle-radius": 4}
            if not _has_alpha(color):
                cp["circle-opacity"] = 0.8
            gl("circle", cp)
        else:
            return None
        return {"$schema": SCHEMA_URL, "legend": legend, "layerStyles": layers}

    # --- graduatedSymbol ---
    if rt == "graduatedSymbol":
        colored = [r for r in parsed["ranges"] if r.get("color")]
        if not colored:
            return None
        legend = [[r["color"] or _DEFAULT_COLOR, r["label"]] for r in parsed["ranges"]]
        stops = _range_stops(colored, lambda r, i: r["color"])
        color_expr = interp() + stops
        if geom == "fill":
            fp = {"fill-color": color_expr}
            if not _has_alpha(color_expr):
                fp["fill-opacity"] = 0.6
            gl("fill", fp)
            gl("line", {"line-color": "rgba(0,0,0,0.2)", "line-width": 0.2})
        elif geom == "line":
            gl("line", {
                "line-color": color_expr,
                "line-width": _line_width_expr(colored, attr),
            })
        elif geom == "circle":
            cp = {"circle-color": color_expr, "circle-radius": 4}
            if not _has_alpha(color_expr):
                cp["circle-opacity"] = 0.8
            gl("circle", cp)
        else:
            return None
        return {"$schema": SCHEMA_URL, "legend": legend, "layerStyles": layers}

    return None


# ===================================================================
# Validation helper
# ===================================================================


def _validate_schema(json_obj: dict) -> list[str]:
    errors: list[str] = []
    try:
        import jsonschema
    except ImportError:
        return ["jsonschema not installed; validation skipped"]
    sp = WEB_ROOT / "vector.schema.json"
    if not sp.exists():
        return ["Could not load vector.schema.json at {}".format(sp)]
    try:
        schema = json.loads(sp.read_text("utf-8"))
        jsonschema.validate(json_obj, schema)
    except Exception as e:
        errors.append("Schema: {}".format(e))
    if not json_obj.get("layerStyles"):
        errors.append("layerStyles empty")
    return errors


# ===================================================================
# CLI
# ===================================================================


def diff_report() -> None:
    subs = sorted(d for d in QGIS_ROOT.iterdir() if d.is_dir() and not d.name.startswith("."))
    rows: list[tuple[str, int, int, int]] = []
    tq = te = 0
    for d in subs:
        ql = list(d.glob("*.qml"))
        if not ql:
            continue
        stems = {f.stem for f in ql}
        wd = WEB_ROOT / d.name
        json_stems = {f.stem for f in wd.glob("*.json")} if wd.is_dir() else set()
        ec = len(stems & json_stems)
        tq += len(ql)
        te += ec
        rows.append((d.name, len(ql), ec, len(ql) - ec))
    rows.sort(key=lambda x: x[3], reverse=True)
    print()
    print("=== QML to JSON Coverage ===")
    print()
    for name, qc, ec, mc in rows:
        pct = round(ec / qc * 100) if qc else 0
        print("  {:25s} {:>3}/{:<3} JSONs ({:>2}%) - {:>3} missing".format(name, ec, qc, pct, mc))
    print()
    print("Total: {} QML files, {} existing JSONs, {} missing".format(tq, te, tq - te))


def convert_subdir(subdir: str, out_dir: str | None = None,
                   force: bool = False, validate: bool = False) -> tuple[int, int, int]:
    """Convert one QGIS sub-directory. Returns (ok, skipped, failed).

    Skipped: output already exists (without --force), raster layers, and
    layers with no convertible vector symbology (null geometry, fully
    transparent symbols, ...).
    """
    qd = QGIS_ROOT / subdir
    if not qd.is_dir():
        print("Warning: {} not found".format(qd), file=sys.stderr)
        return 0, 0, 0
    qmls = sorted(qd.glob("*.qml"))
    if not qmls:
        return 0, 0, 0
    wd = Path(out_dir) if out_dir else WEB_ROOT / subdir
    wd.mkdir(parents=True, exist_ok=True)
    ok = skipped = failed = 0
    for f in qmls:
        tgt = wd / (f.stem + ".json")
        if tgt.exists() and not force:
            skipped += 1
            continue
        try:
            txt = f.read_text("utf-8")
        except Exception as e:
            print("Read error {}: {}".format(f, e), file=sys.stderr)
            failed += 1
            continue
        if "<rasterrenderer" in txt:
            skipped += 1
            continue
        try:
            parsed = parse_qml(txt, str(f))
            if parsed["renderer_type"] == "RuleRenderer":
                distinct = {r["color"] for r in parsed["rules"] if r["color"]}
                if len(distinct) > 1:
                    print(
                        "note {}: {} distinct rule colours; only the first is "
                        "applied (web schema has no per-rule filters)".format(
                            f.name, len(distinct)), file=sys.stderr)
            out = build_json(parsed, f.name)
        except Exception as e:
            print("Parse error {}: {}: {}".format(f, type(e).__name__, e), file=sys.stderr)
            failed += 1
            continue
        if out is None:
            skipped += 1
            print("skip {}: no convertible vector symbology".format(f.name), file=sys.stderr)
            continue
        if validate:
            errs = _validate_schema(out)
            if errs:
                for e in errs:
                    print("{}: {}".format(f.name, e), file=sys.stderr)
                failed += 1
                continue
        try:
            tgt.write_text(json.dumps(out, indent=2, ensure_ascii=False) + "\n", "utf-8")
            ok += 1
        except Exception as e:
            print("Write {}: {}".format(tgt, e), file=sys.stderr)
            failed += 1
    return ok, skipped, failed


def main() -> None:
    p = argparse.ArgumentParser(description="Convert QGIS .qml to Riverscapes JSON")
    p.add_argument("--diff", action="store_true", help="Coverage report (default)")
    p.add_argument("--dir", help="QGIS subdirectory")
    p.add_argument("--out",
                   help="Output directory (with --all: base dir, sub-dirs nested inside)")
    p.add_argument("--all", action="store_true", help="Convert all sub-dirs")
    p.add_argument("--missing", action="store_true",
                   help="Convert only sub-dirs that have missing JSONs (no overwrite)")
    p.add_argument("--force", action="store_true", help="Overwrite existing JSON files")
    p.add_argument("--validate", action="store_true",
                   help="Validate output against Symbology/web/vector.schema.json")
    args = p.parse_args()
    if args.dir:
        ok, sk, fl = convert_subdir(args.dir, args.out,
                                    force=args.force, validate=args.validate)
        print("Converted: {} OK, {} skipped, {} failed".format(ok, sk, fl))
        sys.exit(1 if fl else 0)
    elif args.missing:
        tot_ok = tot_sk = tot_fl = 0
        for d in sorted(d for d in QGIS_ROOT.iterdir()
                        if d.is_dir() and not d.name.startswith(".")):
            ok, sk, fl = convert_subdir(d.name, None,
                                        force=False, validate=args.validate)
            tot_ok += ok
            tot_sk += sk
            tot_fl += fl
            if ok or sk or fl:
                print("  {:25s} -> {} OK, {} skipped, {} fail".format(d.name, ok, sk, fl))
        print("Total: {} OK, {} skipped, {} fail".format(tot_ok, tot_sk, tot_fl))
        sys.exit(1 if tot_fl else 0)
    elif args.all:
        tot_ok = tot_sk = tot_fl = 0
        for d in sorted(d for d in QGIS_ROOT.iterdir()
                        if d.is_dir() and not d.name.startswith(".")):
            out_dir = str(Path(args.out) / d.name) if args.out else None
            ok, sk, fl = convert_subdir(d.name, out_dir,
                                        force=args.force, validate=args.validate)
            tot_ok += ok
            tot_sk += sk
            tot_fl += fl
            if ok or sk or fl:
                print("  {:25s} -> {} OK, {} skipped, {} fail".format(d.name, ok, sk, fl))
        print("Total: {} OK, {} skipped, {} fail".format(tot_ok, tot_sk, tot_fl))
        sys.exit(1 if tot_fl else 0)
    else:
        diff_report()


if __name__ == "__main__":
    main()
