"""Script to help convert layer definitions from schema 0.7.1 to 0.8.0
Tested and worked on rme_to_athena
-Lorin Jan 2026
"""
import argparse
from pathlib import Path
import json

OLD_DTYPE_TO_NEW_MAP = [
    ('ARRAY', 'STRUCTURED'),
    ('MEDIUMINT', 'INTEGER'),
    ('POINT', 'GEOMETRY'),
    ('REAL', 'FLOAT'),
    ('STRUCT', 'STRUCTURED'),
    ('TEXT', 'STRING'),
    ('bigint', 'INTEGER'),
    ('binary', 'BINARY'),
    ('double', 'FLOAT'),
    ('string', 'STRING'),
    ('struct', 'STRUCTURED'),
]


def migrate_layer_definitions(filepath: str) -> bool:
    """
    Migrates a single layer_definitions.json file by renaming 'authority_name' to 'tool_schema_name' and updating dtype values

    Args:
        filepath (str): The absolute path to the layer_definitions.json file.

    Returns:
        bool: True if the file was modified, False if no changes were needed or file was invalid.
    """
    path = Path(filepath)
    with path.open('r', encoding='utf-8') as f:
        try:
            data = json.load(f)
        except json.JSONDecodeError:
            print(f"Skipping invalid JSON: {filepath}")
            return False

    changed = False

    # Check if this file needs migration for authority_name
    if 'authority_name' in data:
        # Rename the key.
        # Issue - the new key automatically goes to the end. Alternative is to replace with regex instead of json - more fragile and complex.
        data['tool_schema_name'] = data.pop('authority_name')
        changed = True

    # Check for dtype migration in layer definitions
    dtype_map = dict(OLD_DTYPE_TO_NEW_MAP)
    if 'layers' in data and isinstance(data['layers'], list):
        for layer in data['layers']:
            if isinstance(layer, dict) and 'columns' in layer and isinstance(layer['columns'], list):
                for column in layer['columns']:
                    if isinstance(column, dict) and 'dtype' in column:
                        old_dtype = column['dtype']
                        new_dtype = dtype_map.get(old_dtype, old_dtype)
                        if new_dtype and new_dtype != old_dtype:
                            column['dtype'] = new_dtype
                            changed = True

    if changed:
        # You can tune indent, separators, and ensure_ascii for minimal diffs with the original file.
        # Example: indent=None, separators=(",", ": "), ensure_ascii=False
        with path.open('w', encoding='utf-8') as f:
            json.dump(data, f, indent=2)
        return True
    return False


def scan_and_migrate(root_dirs: list[Path]):
    """
    Scans the provided root directories for 'layer_definitions.json' files and applies migration.

    It recursively walks through the directory tree looking for files that match the
    exact name 'layer_definitions.json'.

    Args:
        root_dirs (list[Path]): List of Path objects to scan recursively.
    """
    changed_files = []
    unchanged_files = []
    checked = 0
    for root_path in root_dirs:
        if not root_path.exists():
            print(f"Directory not found: {root_path}")
            continue

        print(f"Scanning {root_path}...")
        for path in root_path.rglob('layer_definitions.json'):
            checked += 1
            if migrate_layer_definitions(str(path)):
                changed_files.append(str(path))
            else:
                unchanged_files.append(str(path))

    print(f"\nMigration complete. Scanned {checked} files.")
    print(f"Updated {len(changed_files)} files:")
    for f in changed_files:
        print(f"  [CHANGED] {f}")
    print(f"Unchanged {len(unchanged_files)} files:")
    for f in unchanged_files:
        print(f"  [UNCHANGED] {f}")


def main():
    """
    Main entry point for the migration script.

    Accepts an optional command-line argument for the path to scan. If not provided, uses the current directory.
    """
    parser = argparse.ArgumentParser(description="Migrate layer_definitions.json files from schema 0.7.1 to 0.8.0.")
    parser.add_argument(
        "path",
        nargs="?",
        default=Path.cwd(),
        type=Path,
        help="Directory to scan recursively (default: current directory)"
    )
    args = parser.parse_args()
    scan_path = args.path.resolve()
    print(f"Starting migration scan from: {scan_path}")
    scan_and_migrate([scan_path])


if __name__ == "__main__":
    main()
