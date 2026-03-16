"""In case where a layer_definitions file is already built but missing descriptions,
this will take a csv file with name, description and populate that field. 
NOTE: Assumes there is only one layer in the json - will need to be modified if name needs to be disambiguated by layer. 
"""
from pathlib import Path
import json
import csv

# Paths to the files
json_file_path = Path("pipelines/rme_to_athena/layer_definitions.json")
csv_file_path = Path("pipelines/rme_to_athena/descriptions.csv")


def load_descriptions(csv_path: Path):
    """
    Load descriptions from a CSV file.

    Args:
        csv_path (str): Path to the CSV file containing column names and descriptions.

    Returns:
        dict: A dictionary mapping column names to their descriptions.
    """
    descriptions = {}
    with open(csv_path, "r", encoding="utf-8") as csv_file:
        reader = csv.DictReader(csv_file)
        for row in reader:
            name = row["name"].strip()
            description = row["description"].strip()
            descriptions[name] = description
    return descriptions


def update_json_with_descriptions(json_path: Path, descriptions: dict):
    """
    Update the JSON file with descriptions for columns.

    Args:
        json_path: Path to the JSON file to update.
        descriptions (dict): A dictionary mapping column names to their descriptions.

    Raises:
        ValueError: If no layers are found in the JSON file.
    """
    with open(json_path, "r", encoding="utf-8") as json_file:
        data = json.load(json_file)

    layers = data.get("layers", [])
    if not layers:
        raise ValueError("No layers found in the JSON file.")

    columns = layers[0].get("columns", [])
    for column in columns:
        name = column.get("name")
        if name in descriptions:
            column["description"] = descriptions[name]

    with open(json_path, "w", encoding="utf-8") as json_file:
        json.dump(data, json_file, indent=2)

    print(f"Updated descriptions for {len(descriptions)} columns in {json_path}")


def main():
    """
    Main function to update JSON file with descriptions from a CSV file.

    Checks if the required files exist, loads descriptions from the CSV file,
    and updates the JSON file with the descriptions.
    """
    if not json_file_path.exists():
        print(f"JSON file not found: {json_file_path}")
        return

    if not csv_file_path.exists():
        print(f"CSV file not found: {csv_file_path}")
        return

    descriptions = load_descriptions(csv_file_path)
    update_json_with_descriptions(json_file_path, descriptions)


if __name__ == "__main__":
    main()
