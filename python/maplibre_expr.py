"""Minimal MapLibre GL style-expression evaluator.

The symbologies under ``Symbology/web`` are MapLibre style fragments.  The only
way to know which colour a feature actually ends up with is to evaluate those
expressions the way MapLibre does, so this module implements the subset of the
style specification the symbologies use.  That lets the test suite assert
rendering *semantics* - which attribute is read, and whether a feature that
matches no category gets painted - without a browser or a JS toolchain.

Supported: ``get``, ``has``, ``coalesce``, ``match``, ``case``, ``step``,
``interpolate`` (linear/exponential/cubic-bezier), ``zoom``, the comparison,
arithmetic and boolean operators, ``concat``, ``index-of``, ``slice``,
``to-string`` and friends.  Anything else raises :class:`ExpressionError` so an
unimplemented construct fails a test loudly instead of passing silently.

Known approximations, deliberate and only relevant to colour output:

* ``interpolate`` picks the nearest stop for colour outputs instead of
  interpolating in a colour space.  Numeric outputs are interpolated properly.
* Colour names are limited to the handful used by the symbologies.
"""

import re

__all__ = [
    "ExpressionError",
    "evaluate",
    "resolve",
    "color_rgba",
    "layer_render",
    "referenced_fields",
]

ZOOM = 12.0

_NAMED_COLORS = {
    "transparent": (0.0, 0.0, 0.0, 0.0),
    "none": (0.0, 0.0, 0.0, 0.0),
    "black": (0.0, 0.0, 0.0, 1.0),
    "white": (255.0, 255.0, 255.0, 1.0),
    "red": (255.0, 0.0, 0.0, 1.0),
    "green": (0.0, 128.0, 0.0, 1.0),
    "blue": (0.0, 0.0, 255.0, 1.0),
}

_COLOR_PROPS = (
    "background-color",
    "circle-color",
    "circle-stroke-color",
    "fill-color",
    "fill-outline-color",
    "line-color",
    "text-color",
    "text-halo-color",
)

_OPACITY_PROPS = (
    "background-opacity",
    "circle-opacity",
    "circle-stroke-opacity",
    "fill-opacity",
    "fill-outline-opacity",
    "line-opacity",
    "text-opacity",
    "text-halo-opacity",
)


class ExpressionError(Exception):
    """Raised for a style expression this evaluator does not implement."""


# --------------------------------------------------------------------------- #
# colours
# --------------------------------------------------------------------------- #
_RGB_RE = re.compile(r"^rgba?\(\s*([0-9.]+)\s*,\s*([0-9.]+)\s*,\s*([0-9.]+)\s*(?:,\s*([0-9.]+)\s*)?\)$")
_HSL_RE = re.compile(r"^hsla?\(\s*([0-9.]+)(?:deg)?\s*,\s*([0-9.]+)%\s*,\s*([0-9.]+)%\s*(?:,\s*([0-9.]+)\s*)?\)$")
_HEX_RE = re.compile(r"^#(?:[0-9a-fA-F]{3,4}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")


def _hsl_to_rgb(h, s, lv):
    h = (h % 360.0) / 360.0
    s = min(max(s, 0.0), 1.0)
    lv = min(max(lv, 0.0), 1.0)

    def channel(m, n, hue):
        hue = hue % 1.0
        if hue * 6.0 < 1.0:
            return m + (n - m) * hue * 6.0
        if hue * 2.0 < 1.0:
            return n
        if hue * 3.0 < 2.0:
            return m + (n - m) * (2.0 / 3.0 - hue) * 6.0
        return m

    if s == 0.0:
        return (lv * 255.0, lv * 255.0, lv * 255.0)
    n = lv * (1.0 + s) if lv < 0.5 else lv + s - lv * s
    m = 2.0 * lv - n
    return (
        channel(m, n, h + 1.0 / 3.0) * 255.0,
        channel(m, n, h) * 255.0,
        channel(m, n, h - 1.0 / 3.0) * 255.0,
    )


def color_rgba(value):
    """Parse a CSS colour into ``(r, g, b, a)`` with channels as floats.

    Returns ``None`` for anything that is not a colour we recognise, which lets
    callers distinguish "not a colour property" from "transparent".
    """
    if not isinstance(value, str):
        if _is_color_array(value):
            kind = value[0]
            if kind.startswith("hsl"):
                r, g, b = _hsl_to_rgb(float(value[1]), float(value[2]) / 100.0, float(value[3]) / 100.0)
            else:
                r, g, b = float(value[1]), float(value[2]), float(value[3])
            return (r, g, b, float(value[4]) if len(value) == 5 else 1.0)
        return None
    text = value.strip().lower()
    if text in _NAMED_COLORS:
        return _NAMED_COLORS[text]

    match = _RGB_RE.match(text)
    if match:
        r, g, b, a = match.groups()
        return (float(r), float(g), float(b), 1.0 if a is None else float(a))

    match = _HSL_RE.match(text)
    if match:
        h, s, lv, a = match.groups()
        r, g, b = _hsl_to_rgb(float(h), float(s) / 100.0, float(lv) / 100.0)
        return (r, g, b, 1.0 if a is None else float(a))

    if _HEX_RE.match(text):
        digits = text[1:]
        if len(digits) in (3, 4):
            digits = "".join(c * 2 for c in digits)
        r = float(int(digits[0:2], 16))
        g = float(int(digits[2:4], 16))
        b = float(int(digits[4:6], 16))
        a = float(int(digits[6:8], 16)) / 255.0 if len(digits) == 8 else 1.0
        return (r, g, b, a)
    return None


# --------------------------------------------------------------------------- #
# expressions
# --------------------------------------------------------------------------- #
# The style spec also allows a colour to be written as an array, e.g.
# `["rgba", 255, 170, 0, 1]` ("VBET/vbet_riverscape.json" uses that form).
# That is a value, not an expression, so it must not reach the operator table.
_COLOR_ARRAYS = ("rgb", "rgba", "hsl", "hsla")


def _is_color_array(value):
    if not isinstance(value, list) or len(value) not in (4, 5):
        return False
    return value[0] in _COLOR_ARRAYS


def resolve(value, feature=None, zoom=ZOOM):
    """Evaluate ``value`` if it is an expression, otherwise return it as-is."""
    if not isinstance(value, list) or not value or not isinstance(value[0], str):
        return value
    if _is_color_array(value):
        return value
    if value[0] not in _OPS:
        raise ExpressionError("unsupported expression %r" % (value[0],))
    return _OPS[value[0]](value[1:], feature or {}, zoom)


# alias kept for readability at call sites that are obviously evaluating
evaluate = resolve


def _truthy(value):
    if value is None:
        return False
    if isinstance(value, bool):
        return value
    if isinstance(value, (int, float)):
        return value != 0
    if isinstance(value, str):
        return value != ""
    return bool(value)


def _number(value):
    if isinstance(value, bool) or not isinstance(value, (int, float)):
        return None
    return float(value)


def _same_type_eq(left, right):
    """MapLibre compares with ``==`` but never coerces across types."""
    if left is None or right is None:
        return left is None and right is None
    if isinstance(left, bool) != isinstance(right, bool):
        return False
    if isinstance(left, bool):
        return left == right
    if isinstance(left, (int, float)) and isinstance(right, (int, float)):
        return float(left) == float(right)
    if isinstance(left, str) and isinstance(right, str):
        return left == right
    if isinstance(left, list) and isinstance(right, list):
        return len(left) == len(right) and all(_same_type_eq(a, b) for a, b in zip(left, right))
    return False


def _label_matches(value, label):
    if isinstance(label, list):
        return any(_same_type_eq(value, item) for item in label)
    return _same_type_eq(value, label)


def _op_get(args, feature, zoom):
    return feature.get(args[0])


def _op_has(args, feature, zoom):
    return args[0] in feature


def _op_coalesce(args, feature, zoom):
    for arg in args:
        value = resolve(arg, feature, zoom)
        if value is not None:
            return value
    return None


def _op_match(args, feature, zoom):
    if len(args) < 3:
        raise ExpressionError("match needs at least one label and a default")
    subject = resolve(args[0], feature, zoom)
    pairs = args[1:-1]
    default = args[-1]
    for index in range(0, len(pairs) - 1, 2):
        if _label_matches(subject, pairs[index]):
            return resolve(pairs[index + 1], feature, zoom)
    return resolve(default, feature, zoom)


def _op_case(args, feature, zoom):
    if not args:
        raise ExpressionError("case needs a default")
    for index in range(0, len(args) - 1, 2):
        if _truthy(resolve(args[index], feature, zoom)):
            return resolve(args[index + 1], feature, zoom)
    return resolve(args[-1], feature, zoom)


def _op_step(args, feature, zoom):
    if len(args) < 3:
        raise ExpressionError("step needs an input, an output and a stop")
    subject = resolve(args[0], feature, zoom)
    output = resolve(args[1], feature, zoom)
    subject = _number(subject)
    for index in range(2, len(args) - 1, 2):
        stop = _number(resolve(args[index], feature, zoom))
        if subject is not None and stop is not None and subject >= stop:
            output = resolve(args[index + 1], feature, zoom)
    return output


def _op_interpolate(args, feature, zoom):
    if len(args) < 4:
        raise ExpressionError("interpolate needs a spec, an input and one stop")
    spec = args[0]
    kind = spec[0] if isinstance(spec, list) and spec else spec
    if kind not in ("linear", "exponential", "cubic-bezier"):
        raise ExpressionError("unsupported interpolate kind %r" % (kind,))

    subject = _number(resolve(args[1], feature, zoom))
    stops = [(resolve(args[i], feature, zoom), args[i + 1]) for i in range(2, len(args), 2)]

    lower = None
    upper = None
    for index, (stop, _) in enumerate(stops):
        if subject is not None and stop is not None:
            if subject >= stop:
                lower = (index, stop)
            elif lower is None and upper is None:
                upper = (index, stop)
                break
    if lower is None:
        return resolve(stops[0][1], feature, zoom)
    if upper is None:
        return resolve(stops[lower[0]][1], feature, zoom)

    low_value = resolve(stops[lower[0]][1], feature, zoom)
    high_value = resolve(stops[upper[0]][1], feature, zoom)
    low_number = _number(low_value)
    high_number = _number(high_value)
    span = float(upper[1]) - float(lower[1])
    if low_number is None or high_number is None or span == 0.0:
        # colour (or other non-numeric) output: the nearest stop is close enough
        return low_value if subject - float(lower[1]) <= float(upper[1]) - subject else high_value
    ratio = (subject - float(lower[1])) / span
    return low_number + (high_number - low_number) * ratio


def _op_zoom(args, feature, zoom):
    return zoom


def _op_literal(args, feature, zoom):
    return args[0]


def _op_not(args, feature, zoom):
    return not _truthy(resolve(args[0], feature, zoom))


def _op_all(args, feature, zoom):
    return all(_truthy(resolve(arg, feature, zoom)) for arg in args)


def _op_any(args, feature, zoom):
    return any(_truthy(resolve(arg, feature, zoom)) for arg in args)


def _comparison(test):
    def op(args, feature, zoom):
        left = resolve(args[0], feature, zoom)
        right = resolve(args[1], feature, zoom)
        return test(left, right)
    return op


def _op_in(args, feature, zoom):
    needle = resolve(args[0], feature, zoom)
    haystack = resolve(args[1], feature, zoom)
    if haystack is None:
        return False
    if isinstance(haystack, str):
        return isinstance(needle, str) and needle in haystack
    if isinstance(haystack, list):
        return any(_same_type_eq(needle, item) for item in haystack)
    return False


def _ordered(compare):
    def op(left, right):
        left = _number(left)
        right = _number(right)
        if left is None or right is None:
            return False
        return compare(left, right)
    return op


def _op_concat(args, feature, zoom):
    parts = []
    for arg in args:
        value = resolve(arg, feature, zoom)
        parts.append("" if value is None else str(value))
    return "".join(parts)


def _op_to_string(args, feature, zoom):
    value = resolve(args[0], feature, zoom)
    if value is None:
        return ""
    if isinstance(value, float) and value.is_integer():
        return str(int(value))
    return str(value)


def _op_index_of(args, feature, zoom):
    needle = resolve(args[0], feature, zoom)
    haystack = resolve(args[1], feature, zoom)
    if not isinstance(needle, str) or not isinstance(haystack, str):
        return -1
    return haystack.find(needle)


def _op_slice(args, feature, zoom):
    value = resolve(args[0], feature, zoom)
    if not isinstance(value, (list, str)):
        return None
    start = int(_number(resolve(args[1], feature, zoom)) or 0)
    if len(args) > 2:
        end = int(_number(resolve(args[2], feature, zoom)) or 0)
        return value[start:end]
    return value[start:]


def _arithmetic(test):
    def op(args, feature, zoom):
        left = _number(resolve(args[0], feature, zoom))
        right = _number(resolve(args[1], feature, zoom))
        if left is None or right is None:
            return None
        return test(left, right)
    return op


_OPS = {
    "get": _op_get,
    "has": _op_has,
    "coalesce": _op_coalesce,
    "match": _op_match,
    "case": _op_case,
    "step": _op_step,
    "interpolate": _op_interpolate,
    "interpolate-hcl": _op_interpolate,
    "interpolate-lab": _op_interpolate,
    "zoom": _op_zoom,
    "literal": _op_literal,
    "!": _op_not,
    "all": _op_all,
    "any": _op_any,
    "==": _comparison(lambda a, b: _same_type_eq(a, b)),
    "!=": _comparison(lambda a, b: not _same_type_eq(a, b)),
    "<": _comparison(_ordered(lambda a, b: a < b)),
    "<=": _comparison(_ordered(lambda a, b: a <= b)),
    ">": _comparison(_ordered(lambda a, b: a > b)),
    ">=": _comparison(_ordered(lambda a, b: a >= b)),
    "in": _op_in,
    "!in": lambda args, feature, zoom: not _op_in(args, feature, zoom),
    "+": _arithmetic(lambda a, b: a + b),
    "-": _arithmetic(lambda a, b: a - b),
    "*": _arithmetic(lambda a, b: a * b),
    "/": _arithmetic(lambda a, b: None if b == 0 else a / b),
    "%": _arithmetic(lambda a, b: None if b == 0 else a % b),
    "^": _arithmetic(lambda a, b: a ** b),
    "concat": _op_concat,
    "to-string": _op_to_string,
    "string": _op_to_string,
    "number": lambda args, feature, zoom: _number(resolve(args[0], feature, zoom)),
    "index-of": _op_index_of,
    "slice": _op_slice,
}


# --------------------------------------------------------------------------- #
# a whole layer, rendered
# --------------------------------------------------------------------------- #
def _freeze(value):
    if isinstance(value, list):
        return tuple(_freeze(item) for item in value)
    if isinstance(value, dict):
        return tuple(sorted((key, _freeze(item)) for key, item in value.items()))
    if isinstance(value, bool):
        return value
    if isinstance(value, (int, float)):
        return round(float(value), 6)
    return value


def _opacities(paint, feature, zoom):
    opacities = {}
    for key in _OPACITY_PROPS:
        if key in paint:
            value = _number(resolve(paint[key], feature, zoom))
            opacities[key] = 1.0 if value is None else value
    return opacities


def _color_alpha(key, value, opacities):
    rgba = color_rgba(value)
    if rgba is None:
        return 0.0
    opacity = opacities.get("%s-opacity" % key.rsplit("-", 1)[0], 1.0)
    return rgba[3] * opacity


def layer_render(layer, feature=None, zoom=ZOOM):
    """Describe what ``layer`` draws for ``feature``.

    Returns ``None`` when the layer paints nothing: either its ``filter``
    rejects the feature, or every colour it would draw is fully transparent.
    Otherwise returns a hashable tuple of the layer's resolved paint, so two
    renders can be compared for equality.
    """
    feature = feature or {}
    filt = layer.get("filter")
    if filt is not None and not _truthy(resolve(filt, feature, zoom)):
        return None

    paint = layer.get("paint") or {}
    opacities = _opacities(paint, feature, zoom)
    resolved = []
    strongest = 0.0
    has_color = False
    for key in sorted(paint):
        value = resolve(paint[key], feature, zoom)
        alpha = 0.0
        if key.endswith("-color"):
            has_color = True
            alpha = _color_alpha(key, value, opacities)
        strongest = max(strongest, alpha)
        resolved.append((key, _freeze(value), round(alpha, 6)))

    if has_color:
        if strongest <= 0.0:
            return None
    elif opacities and min(opacities.values()) <= 0.0:
        # A layer with no colour of its own draws the default colour, gated by
        # nothing but its opacity - `line-opacity: match(..., 1, 0)` is how the
        # symbologies hide an outline they do not want to draw.
        return None
    return tuple(resolved)


def referenced_fields(node, found=None):
    """Collect every attribute name an expression reads with ``get``."""
    if found is None:
        found = set()
    if isinstance(node, list):
        if node and node[0] == "get" and len(node) > 1 and isinstance(node[1], str):
            found.add(node[1])
            return found
        for item in node:
            referenced_fields(item, found)
    elif isinstance(node, dict):
        for item in node.values():
            referenced_fields(item, found)
    return found
