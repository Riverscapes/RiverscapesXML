# Philip
# March 2026
# Hacky, prototype script to convert QGIS .qml files to Mapbox GL JS style JSON fragments.
# Works pretty well for simple categorized styles with a single attribute and range-based classes.
import os
import json
import xml.etree.ElementTree as ET

# Define paths
qml_dir = "/Users/philipbailey/code/riverscapes/RiverscapesXML/Symbology/qgis/CHaMPMetrics"
json_dir = "/Users/philipbailey/code/riverscapes/RiverscapesXML/Symbology/web/CHaMPMetrics"
template_json_path = os.path.join(json_dir, "discharge.json")

# Define target colors (Yellow -> Green -> Red)
TARGET_COLORS = [
    "rgb(255, 255, 0)",      # Yellow
    "rgb(154, 205, 50)",     # Yellow Green
    "rgb(34, 139, 34)",      # Forest Green
    "rgb(255, 140, 0)",      # Dark Orange
    "rgb(220, 20, 60)"       # Crimson Red
]

# Files to exclude
EXCLUDE_FILES = ["discharge.qml", "sites.qml", "watersheds.qml", ".DS_Store"]


def parse_qml(qml_path):
    tree = ET.parse(qml_path)
    root = tree.getroot()

    # Get renderer
    renderer = root.find("renderer-v2")
    if renderer is None:
        return None, None

    attr = renderer.get("attr")

    ranges = []
    ranges_elem = renderer.find("ranges")
    if ranges_elem is not None:
        for r in ranges_elem.findall("range"):
            ranges.append({
                "lower": float(r.get("lower")),
                "upper": float(r.get("upper")),
                "label": r.get("label")
            })

    # Sort ranges just in case
    ranges.sort(key=lambda x: x["lower"])

    return attr, ranges


def generate_json_content(template, attr, ranges):
    new_json = json.loads(json.dumps(template))  # Deep copy

    # Update legend
    legend = []

    # Map colors to ranges
    # We use min(len(ranges), len(TARGET_COLORS))
    num_classes = len(ranges)

    # If we have more ranges than colors, we might run out of colors.
    # If we have fewer, we use fewer colors.

    # Construct step expression
    # ["step", ["get", attr], default_color, stop1, color1, stop2, color2...]

    step_expr = ["step", ["get", attr]]

    # Default color corresponds to the first range (values < stop1)
    # Actually, step works as: everything below first stop gets default color.
    # Our first range is usually min -> stop1.
    # So default color = color for range 0.

    # Assign colors
    range_colors = []
    for i in range(num_classes):
        if i < len(TARGET_COLORS):
            range_colors.append(TARGET_COLORS[i])
        else:
            range_colors.append(TARGET_COLORS[-1])  # Reuse last color if needed

    # Set default color (Range 0 color)
    step_expr.append(range_colors[0])

    # Add subsequent stops
    for i in range(1, num_classes):
        # Stop value is the lower bound of the current range (which is upper of prev)
        stop_val = ranges[i]["lower"]
        color = range_colors[i]

        step_expr.append(stop_val)
        step_expr.append(color)

    # Build legend
    for i in range(num_classes):
        legend.append([range_colors[i], ranges[i]["label"]])

    new_json["legend"] = legend
    new_json["layerStyles"][0]["paint"]["circle-color"] = step_expr

    # Update ID to match filename (optional but good practice)
    # Actually user said "similar JSON", usually ID should invoke the style name.
    # But usually we keep it simple. Let's keep the ID from template but maybe append something?
    # No, let's keep it as is since user didn't specify.
    # Wait, the `id` in layerStyles is "rme-igos-sample-2f60tk". This looks like a specific layer ID from Mapbox.
    # If all these styles apply to the same source layer, checking if `id` needs to be unique.
    # Usually in GL JS style spec, `id` must be unique in the whole style object.
    # But these are individual style fragments likely to be loaded separately.
    # I'll keep it as "rme-igos-sample-2f60tk" to match `discharge.json`.

    return new_json


def main():
    # Load template
    with open(template_json_path, "r") as f:
        template = json.load(f)

    # Process files
    for filename in os.listdir(qml_dir):
        if filename in EXCLUDE_FILES or not filename.endswith(".qml"):
            continue

        qml_path = os.path.join(qml_dir, filename)
        json_filename = filename.replace(".qml", ".json")
        json_path = os.path.join(json_dir, json_filename)

        print(f"Processing {filename}...")

        try:
            attr, ranges = parse_qml(qml_path)
            if not attr or not ranges:
                print(f"Skipping {filename}: Could not parse renderer or ranges.")
                continue

            new_json = generate_json_content(template, attr, ranges)

            with open(json_path, "w") as f:
                json.dump(new_json, f, indent=2)

            print(f"Generated {json_filename}")

        except Exception as e:
            print(f"Error processing {filename}: {e}")


if __name__ == "__main__":
    main()
