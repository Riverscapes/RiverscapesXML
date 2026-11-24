#!/usr/bin/env python3
"""QGIS .qml to Riverscapes JSON Web Symbology converter.

Handles all vector renderer types (graduatedSymbol, singleSymbol,
categorizedSymbol, RuleRenderer), geometry types (line/fill/marker), both
<Option> and <prop> QML attribute formats, translucent colours, custom dash
patterns, per-rule filters, and <range>/<category> labels. Raster layers and
layers without geometry are skipped, not failed.

Two rules follow from issue #1054 ("Web Intermittent Drainage Network"),
where the intermittent layer also drew every other flowline as a thin grey
line:

* Field lookups are case-insensitive (_field_expr). QGIS matches field names
  case-insensitively, Mapbox GL does not, and a layer reaches the web as
  either `fcode` or `FCode` depending on the source the tile was cut from.
  Emitting the QML's spelling verbatim is what has silently broken the NHD
  flowline symbology repeatedly (issues #1000, #1022, #1054).  The known
  spellings live in _FIELD_ALIASES, so a field whose QML spelling is all
  lower case still gets a lookup for the camel case the tiles may use.
* Features that match no category are left unpainted, never given a fallback
  colour (_TRANSPARENT). A renderer only owns the features its categories
  describe; painting the rest is what turned the whole drainage network grey.

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
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Any


SCHEMA_URL = "https://xml.riverscapes.xyz/Symbology/web/vector.schema.json"
EPSILON = 0.0001
_DEFAULT_COLOR = "rgb(128,128,128)"
# Fallback for features that match no category. Transparent, not grey: the
# grey it replaced painted features the renderer does not own (#1054).
_TRANSPARENT = "rgba(0,0,0,0)"
_GEOMS = ("line", "fill", "marker")
# QGIS length units in millimetres, for reconciling a dash pattern with the
# line width it is drawn at.
_UNIT_MM = {"mm": 1.0, "point": 0.3527777778, "inch": 25.4}
# Attribute names that reach the tiles under more than one spelling, and every
# spelling to probe.  A GeoPackage column arrives lower-cased, a shapefile or a
# view keeps the source spelling, and a few rule filters spell it all upper.
# Add an entry here whenever a symbology breaks the same way again.
_FIELD_ALIASES = {
    "fcode": ("FCode", "fcode", "FCODE"),
}
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


def _field_expr(attr: str) -> Any:
    """Mapbox expression reading a QGIS field name, whatever its casing.

    QGIS resolves a field name case-insensitively; Mapbox GL does not, and a
    layer arrives in the browser as `fcode` or `FCode` depending on what the
    tile was built from (a GeoPackage column comes out lower-cased, a
    shapefile or a view keeps the source spelling). Probe every casing and
    use whichever one the tile actually carries.
    """
    if not attr:
        return ["get", ""]
    aliases = _FIELD_ALIASES.get(attr.lower())
    if aliases:
        return ["coalesce"] + [["get", n] for n in aliases]
    names = list(dict.fromkeys([attr, attr.lower(), attr.upper()]))
    if len(names) == 1:
        return ["get", names[0]]
    return ["coalesce"] + [["get", n] for n in names]


def _dash_array(opts: dict[str, str], width: float) -> list | None:
    """QGIS custom dash pattern -> Mapbox `line-dasharray`.

    QGIS keeps the pattern in `customdash` as ';'-separated lengths in
    `customdash_unit` and strokes the line at `line_width` in
    `line_width_unit`. Mapbox expresses the pattern in multiples of the line
    width, so scale the pattern and the width to a common unit and divide.
    """
    if opts.get("use_custom_dash", "").strip().lower() not in ("1", "true"):
        return None
    raw = opts.get("customdash") or ""
    try:
        parts = [float(p) for p in raw.split(";") if p.strip()]
    except ValueError:
        return None
    if len(parts) < 2 or any(p < 0 for p in parts) or sum(parts) <= 0:
        return None
    dash_unit = _UNIT_MM.get((opts.get("customdash_unit") or "").strip().lower())
    width_unit = _UNIT_MM.get((opts.get("line_width_unit") or "").strip().lower())
    if dash_unit and width_unit:
        parts = [p * dash_unit for p in parts]
        width = width * width_unit
    if width > 0:
        parts = [p / width for p in parts]
    # Mapbox wants an even number of values (a repeated on/off pattern).
    if len(parts) % 2:
        parts = parts[:-1]
    return [round(p, 3) for p in parts] or None


def _line_style(opts: dict[str, str], sym_type: str) -> tuple:
    """(colour, line_width, dasharray) of a line symbol."""
    width = _num_width(opts, "line_width", 1.0)
    return _symbol_color(opts, sym_type), width, _dash_array(opts, width)


def _shared_dash(items: list[dict]) -> list | None:
    """The dash pattern to paint when every symbol in a renderer agrees.

    `line-dasharray` is not a data-driven paint property, so a renderer whose
    categories mix solid and dashed lines cannot say so in one web layer.
    Emit the shared pattern, or nothing when the symbols disagree.
    """
    patterns = {json.dumps(i.get("dash")) for i in items}
    if len(patterns) != 1:
        return None
    return items[0].get("dash") or None


def _dash_groups(items: list[dict]) -> list[list[dict]]:
    """Split categories/ranges into one group per distinct dash pattern."""
    groups: dict[str, list[dict]] = {}
    for item in items:
        groups.setdefault(json.dumps(item.get("dash")), []).append(item)
    return list(groups.values())


def _value_filter(items: list[dict], field: list) -> list:
    """Restrict a layer to the category values it actually paints.

    Needed wherever the colour collapses to a single value: a one-category
    renderer has no `match` to fall through, so without this the layer would
    paint every feature in the tile (issue #1054, inverted).
    """
    values = [_int_if_integral(_num(i["value"])) for i in items]
    if all(isinstance(v, (int, str)) for v in values):
        return ["match", field, values, True, False]
    return ["any"] + [["==", field, v] for v in values]


def _value_match(items: list[dict], key: str, fallback: Any, field: list) -> Any:
    """A `match` on field when the categories disagree about key."""
    values = [i.get(key, fallback) for i in items]
    if all(v == values[0] for v in values):
        return values[0]
    expr: list = ["match", field]
    for item, value in zip(items, values):
        expr.extend([_num(item["value"]), value])
    expr.append(fallback)
    return expr


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
            color, line_width, dash = _line_style(entry["opts"], entry["type"])
            ss: dict[str, Any] = {
                "type": entry["type"],
                "color": color,
                "line_width": line_width,
                "dash": dash,
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
                color, line_width, dash = (
                    _line_style(entry["opts"], entry["type"])
                    if entry else (None, 1.0, None))
                result["categories"].append({
                    "value": value,
                    "label": cat.get("label") or value,
                    "color": color,
                    "line_width": line_width,
                    "dash": dash,
                })

    # RuleRenderer
    elif result["renderer_type"] == "RuleRenderer":
        rules_el = renderer.find("rules")
        if rules_el is not None:
            # iter() catches nested (group) rules in document order
            for rule in rules_el.iter("rule"):
                color = line_width = dash = None
                inline = rule.find("symbol")
                if inline is not None and inline.get("type") in _GEOMS:
                    color, line_width, dash = _line_style(
                        _options(inline), inline.get("type"))
                else:
                    entry = syms.get(rule.get("symbol") or "")
                    if entry:
                        color, line_width, dash = _line_style(
                            entry["opts"], entry["type"])
                result["rules"].append({
                    "label": rule.get("label") or "",
                    "filter": rule.get("filter") or "",
                    "color": color,
                    "line_width": line_width if line_width is not None else 1.0,
                    "dash": dash,
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
                color, line_width, dash = _line_style(opts, stype)
                label = rg.get("label") or ""
                if not label:
                    label = "{} - {}".format(_fmt(lo), _fmt(hi))
                result["ranges"].append({
                    "lower": lo,
                    "upper": hi,
                    "label": label,
                    "color": color,
                    "line_width": line_width,
                    "dash": dash,
                })
            result["ranges"].sort(key=lambda r: r["lower"])

    return result


# ===================================================================
# QGIS rule filter -> Mapbox GL expression
# ===================================================================


class FilterUnsupported(Exception):
    """Raised for QGIS rule-filter syntax this converter cannot translate."""


_FILTER_TOKEN = re.compile(
    r"""\s*(?:
        (?P<lparen>\() |
        (?P<rparen>\)) |
        (?P<comma>,) |
        (?P<op><>|<=|>=|!=|=|<|>) |
        (?P<string>'(?:[^']|'')*') |
        (?P<number>[-+]?(?:\d+\.?\d*|\.\d+)) |
        (?P<ident>[A-Za-z_][A-Za-z_0-9]*) |
        (?P<field>"(?:[^"]|"")*")
    )""", re.VERBOSE)

_KEYWORDS = ("and", "or", "not", "in", "is", "null", "like")


def _tokenize_filter(text: str) -> list[tuple[str, str]]:
    tokens: list[tuple[str, str]] = []
    pos = 0
    while pos < len(text):
        m = _FILTER_TOKEN.match(text, pos)
        if m is None:
            if text[pos:].strip() == "":
                break
            raise FilterUnsupported("unexpected text {!r}".format(text[pos:pos + 20]))
        pos = m.end()
        kind, val = m.lastgroup or "", m.group(m.lastgroup or 0) or ""
        if kind == "ident" and val.lower() in _KEYWORDS:
            kind = val.lower()
        tokens.append((kind, val))
    return tokens


def _int_if_integral(v: Any) -> Any:
    """Normalise 46006.0 to 46006: `match` labels must be integers."""
    if isinstance(v, float) and v.is_integer():
        return int(v)
    return v


def _filter_literal(kind: str, val: str) -> Any:
    if kind == "string":
        return _num(val[1:-1].replace("''", "'"))
    return _num(val)


def _unquote_ident(raw: str) -> str:
    if len(raw) >= 2 and raw[0] == '"' and raw[-1] == '"':
        return raw[1:-1].replace('""', '"')
    return raw


def _field_names(expr: Any) -> list[str] | None:
    """Source field names behind a _field_expr, or None if it is not one."""
    if isinstance(expr, list) and len(expr) == 2 and expr[0] == "get":
        return [expr[1]]
    if isinstance(expr, list) and expr and expr[0] == "coalesce":
        names = [e[1] for e in expr[1:] if isinstance(e, list) and e[0] == "get"]
        return names or None
    return None


class _FilterParser:
    """Recursive-descent parser for the QGIS rule-filter subset we support.

    Handles `=`, `<>`, `!=`, `<`, `>`, `<=`, `>=`, `IN (...)`, `AND`, `OR`,
    `NOT` and parentheses - which covers every filter in the repository's
    RuleRenderer symbologies - and raises FilterUnsupported for anything
    else rather than guessing.
    """

    _FLIP = {"<": ">", ">": "<", "<=": ">=", ">=": "<="}

    def __init__(self, text: str) -> None:
        self.tokens = _tokenize_filter(text)
        self.i = 0

    def _kind(self) -> str:
        return self.tokens[self.i][0] if self.i < len(self.tokens) else "end"

    def _take(self, kind: str | None = None) -> tuple[str, str]:
        if self._kind() == "end":
            raise FilterUnsupported("unexpected end of filter")
        tok = self.tokens[self.i]
        if kind is not None and tok[0] != kind:
            raise FilterUnsupported("expected {} but found {!r}".format(kind, tok[1]))
        self.i += 1
        return tok

    def parse(self) -> Any:
        expr = self._or()
        if self._kind() != "end":
            raise FilterUnsupported("trailing {!r}".format(self.tokens[self.i][1]))
        return expr

    def _or(self) -> Any:
        terms = [self._and()]
        while self._kind() == "or":
            self._take()
            terms.append(self._and())
        return terms[0] if len(terms) == 1 else ["any"] + terms

    def _and(self) -> Any:
        terms = [self._not()]
        while self._kind() == "and":
            self._take()
            terms.append(self._not())
        return terms[0] if len(terms) == 1 else ["all"] + terms

    def _not(self) -> Any:
        if self._kind() == "not":
            self._take()
            return ["!", self._not()]
        return self._atom()

    def _peek_kind(self, ahead: int = 0) -> str:
        j = self.i + ahead
        return self.tokens[j][0] if j < len(self.tokens) else "end"

    def _atom(self) -> Any:
        if self._kind() == "lparen":
            # Distinguish a bracketed group - "(a AND b)" - from a bare field
            # QGIS wrapped in brackets, as in "(integrated_width) > 500".
            ahead = (self._peek_kind(1), self._peek_kind(2), self._peek_kind(3))
            if ahead[0] in ("field", "ident", "number", "string") and \
                    ahead[1] == "rparen" and ahead[2] in ("op", "in"):
                self._take()
                inner = self._operand()
                self._take("rparen")
                return self._comparison(inner)
            self._take()
            expr = self._or()
            self._take("rparen")
            return expr
        return self._comparison()

    def _operand(self, allow_field: bool = True) -> Any:
        kind, val = self._take()
        if kind in ("field", "ident"):
            if not allow_field:
                raise FilterUnsupported("expected a literal, found {!r}".format(val))
            return _field_expr(_unquote_ident(val))
        if kind in ("string", "number"):
            return _filter_literal(kind, val)
        raise FilterUnsupported("unexpected {!r}".format(val))

    def _comparison(self, left: Any = None) -> Any:
        if left is None:
            left = self._operand()
        kind = self._kind()
        if kind == "in":
            self._take()
            self._take("lparen")
            values = [_int_if_integral(self._operand(allow_field=False))]
            while self._kind() == "comma":
                self._take()
                values.append(_int_if_integral(self._operand(allow_field=False)))
            self._take("rparen")
            if not isinstance(left, list):
                raise FilterUnsupported("IN needs a field on the left")
            # `match` labels must be integers or strings; fall back to a
            # chain of equalities for anything else (e.g. 0.5).
            if values and all(isinstance(v, int) or isinstance(v, str) for v in values):
                return ["match", left, values, True, False]
            return ["any"] + [["==", left, v] for v in values]
        if kind == "like":
            self._take()
            return self._like(left)
        is_null = kind in ("null", "is") or (
            kind == "op" and
            self.tokens[self.i][1] in ("=", "!=") and
            self._peek_kind(1) == "null")
        if is_null:
            return self._null_test(left)
        if kind != "op":
            raise FilterUnsupported("expected an operator, found {!r}".format(
                self.tokens[self.i][1] if self.i < len(self.tokens) else "end"))
        op = self._take()[1]
        # QGIS spells equality '='; the style spec spells it '=='.
        op = {"<>": "!=", "=": "=="}.get(op, op)
        right = self._operand()
        if isinstance(left, list) and isinstance(right, list):
            raise FilterUnsupported("cannot compare two fields")
        if isinstance(right, list):
            left, right = right, left
            op = self._FLIP.get(op, op)
        if isinstance(right, list):
            raise FilterUnsupported("needs a field and a literal")
        return [op, left, right]

    def _null_test(self, left: Any) -> Any:
        """`x = NULL` / `x IS [NOT] NULL` as a property-presence test.

        A tile omits a null property rather than carrying it, so absence is
        the closest thing the web layer has to SQL NULL.
        """
        if self._kind() == "is":
            self._take()
            negate = self._kind() == "not"
            if negate:
                self._take()
            self._take("null")
        else:
            negate = self._take()[1] == "!="
            self._take("null")
        names = _field_names(left)
        if not names:
            raise FilterUnsupported("NULL test needs a plain field")
        present = ["has", names[0]] if len(names) == 1 else \
            ["any"] + [["has", n] for n in names]
        return present if negate else ["!", present]

    def _like(self, left: Any) -> Any:
        """SQL LIKE with % wildcards, via `in`'s substring test and slice."""
        lkind, lval = self._take()
        if lkind != "string":
            raise FilterUnsupported("LIKE needs a quoted pattern")
        pattern = lval[1:-1].replace("''", "'")
        # SQL treats '_' as a single-character wildcard, but every pattern in
        # this repository uses it literally ("%Early_Cretaceous%" matches the
        # value 'Early_Cretaceous'), so match it literally rather than drop
        # the rule. Mapbox has no single-character wildcard to translate to.
        text = ["to-string", left]
        if "%" not in pattern:
            return ["==", text, pattern]
        core = pattern.strip("%")
        if not core or "%" in core:
            raise FilterUnsupported("LIKE needs at most one wildcard at each end")
        if pattern.startswith("%") and pattern.endswith("%"):
            return ["in", core, text]
        if pattern.endswith("%"):
            return ["==", ["slice", text, 0, len(core)], core]
        return ["==", ["slice", text, -len(core)], core]


def _translate_filter(text: str) -> Any:
    """Mapbox filter expression for a QGIS rule filter."""
    return _FilterParser(text).parse()


def _rule_filter(raw: str | None) -> Any:
    """Mapbox filter for one rule.

    An unfiltered/ELSE rule returns None (a catch-all layer), a translatable
    filter returns the expression, and unsupported QGIS syntax returns False
    so the caller drops the rule instead of painting features it does not own.
    """
    text = (raw or "").strip()
    if text == "" or text.upper() == "ELSE":
        return None
    try:
        return _translate_filter(text)
    except FilterUnsupported as e:
        print("warning: unsupported QGIS rule filter {}: {}".format(text, e),
              file=sys.stderr)
        return False


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
    return ["interpolate", ["linear"], _field_expr(attr)] + \
        _range_stops(rng, lambda r, i: r["line_width"])


def _has_alpha(v: Any) -> bool:
    """True when a colour value (string or expression) carries its own alpha."""
    if isinstance(v, str):
        return v.startswith("rgba")
    if isinstance(v, list):
        return any(isinstance(x, str) and x.startswith("rgba") for x in v)
    return False


def _make_layer(lid: str, typ: str, sl: str, paint: dict,
                filt: Any = None) -> dict:
    layer = {
        "id": lid,
        "type": typ,
        "source": "composite",
        "source-layer": sl,
    }
    if filt is not None:
        layer["filter"] = filt
    layer["layout"] = {}
    layer["paint"] = paint
    return layer


def build_json(parsed: dict[str, Any], qml_filename: str) -> dict | None:
    rt = parsed["renderer_type"]
    geom = parsed["geometry_type"]
    attr = parsed["attr"]
    if geom not in ("line", "fill", "circle"):
        return None
    sid = Path(qml_filename).stem
    # The web viewer always replaces source-layer with the tile's real layer
    # name (see renderableLayers.ts), so it must only be something stable and
    # honest. It used to be the QGIS attribute name, which read like a layer.
    sl = sid
    layers: list[dict] = []

    def gl(typ, paint, filt=None, tag=None):
        lid = "{}-{}{}".format(sid, typ, "-{}".format(tag) if tag else "")
        layers.append(_make_layer(lid, typ, sl, paint, filt))

    def interp() -> list:
        return ["interpolate", ["linear"], _field_expr(attr)]

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
            lp = {"line-color": c, "line-width": s.get("line_width", 1)}
            if s.get("dash"):
                lp["line-dasharray"] = s["dash"]
            gl("line", lp)
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
        field = _field_expr(attr)
        mx = ["match", field]
        for c in cats:
            mx.extend([_num(c["value"]), c["color"]])
        mx.append(_TRANSPARENT)
        # Only the colours the renderer actually draws decide whether they need
        # toning down; the transparent fallback is not one of them.
        translucent = any(_has_alpha(c["color"]) for c in cats)
        if geom == "fill":
            fp = {"fill-color": mx}
            if not translucent:
                fp["fill-opacity"] = 0.7
            gl("fill", fp)
            gl("line", {"line-color": "rgba(0,0,0,0.2)", "line-width": 0.2})
        elif geom == "line":
            # `line-dasharray` is not a data-driven paint property, so a
            # renderer mixing solid and dashed categories needs one layer per
            # dash pattern - otherwise the QGIS dash (present in the NHD
            # flowlines, and missing from every auto-converted file) is lost.
            for n, group in enumerate(_dash_groups(cats)):
                lp = {
                    "line-color": _value_match(group, "color", _TRANSPARENT, field),
                    "line-width": _value_match(group, "line_width", 1, field),
                }
                if group[0].get("dash"):
                    lp["line-dasharray"] = group[0]["dash"]
                gl("line", lp, _value_filter(group, field), n or None)
        elif geom == "circle":
            cp = {"circle-color": mx, "circle-radius": 4}
            if not translucent:
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
        # QGIS strokes the rules top-down and honours an ELSE/empty catch-all;
        # Mapbox paints layers bottom-up, so reverse the document order. Keep
        # one layer per rule with its filter - flattening the renderer to a
        # single colour painted the entire RSContext flowline network blue.
        legend = [[r["color"] or _DEFAULT_COLOR, r["label"]] for r in rules]
        rules = list(reversed(rules))
        painted = 0
        for i, r in enumerate(rules):
            color = r["color"]
            if not color:
                continue
            filt = _rule_filter(r.get("filter"))
            if filt is False:
                continue
            if geom == "fill":
                fp = {"fill-color": color}
                if not _has_alpha(color):
                    fp["fill-opacity"] = 0.6
                gl("fill", fp, filt, i)
                gl("line", {"line-color": "rgba(0,0,0,0.2)", "line-width": 0.2},
                   filt, "{}-outline".format(i))
            elif geom == "line":
                lp = {"line-color": color, "line-width": r.get("line_width", 1.0)}
                if r.get("dash"):
                    lp["line-dasharray"] = r["dash"]
                gl("line", lp, filt, i)
            else:
                cp = {"circle-color": color, "circle-radius": 4}
                if not _has_alpha(color):
                    cp["circle-opacity"] = 0.8
                gl("circle", cp, filt, i)
            painted += 1
        if not painted:
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
            lp = {
                "line-color": color_expr,
                "line-width": _line_width_expr(colored, attr),
            }
            dash = _shared_dash(colored)
            if dash:
                lp["line-dasharray"] = dash
            gl("line", lp)
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
