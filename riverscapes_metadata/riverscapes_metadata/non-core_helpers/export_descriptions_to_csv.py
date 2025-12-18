import json
import csv

# Path to the JSON file
json_file_path = "pipelines/rme_to_athena/layer_definitions.json"
# Path to the output CSV file
csv_file_path = "pipelines/rme_to_athena/column_descriptions.csv"

# Load the JSON file
with open(json_file_path, "r", encoding="utf-8") as json_file:
    data = json.load(json_file)

# Extract the columns
columns = data.get("layers", [])[0].get("columns", [])

# Write to CSV
with open(csv_file_path, "w", newline="", encoding="utf-8") as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(["name", "description"])  # Header row

    for column in columns:
        writer.writerow([column.get("name", ""), column.get("description", "")])

print(f"Exported {len(columns)} columns to {csv_file_path}")
