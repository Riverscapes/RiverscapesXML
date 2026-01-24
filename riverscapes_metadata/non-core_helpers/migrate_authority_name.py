import os
import json
from typing import List

def migrate_layer_definitions(filepath: str) -> bool:
    """
    Migrates a single layer_definitions.json file by renaming 'authority_name' to 'tool_schema_name'.
    
    This function checks if the file contains the legacy 'authority_name' key.
    If found, it replaces it with 'tool_schema_name', preserving the value,
    and writes the file back to disk with consistent indentation.
    
    Args:
        filepath (str): The absolute path to the layer_definitions.json file.
        
    Returns:
        bool: True if the file was modified, False if no changes were needed or file was invalid.
    """
    with open(filepath, 'r', encoding='utf-8') as f:
        try:
            data = json.load(f)
        except json.JSONDecodeError:
            print(f"Skipping invalid JSON: {filepath}")
            return False

    # Check if this file needs migration
    if 'authority_name' in data:
        print(f"Migrating {filepath}...")
        
        # Rename the key
        # We use pop to remove the old key and return its value
        data['tool_schema_name'] = data.pop('authority_name')
        
        # Note: tool_schema_version is left untouched as 0.8 is considered the target version.

        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4)
        return True
    
    return False

def scan_and_migrate(root_dirs: List[str]):
    """
    Scans the provided root directories for 'layer_definitions.json' files and applies migration.
    
    It recursively walks through the directory tree looking for files that match the 
    exact name 'layer_definitions.json'.
    
    Args:
        root_dirs (List[str]): List of absolute directory paths to scan recursively.
    """
    count = 0
    checked = 0
    for root_dir in root_dirs:
        if not os.path.exists(root_dir):
            print(f"Directory not found: {root_dir}")
            continue
            
        print(f"Scanning {root_dir}...")
        for root, dirs, files in os.walk(root_dir):
            for file in files:
                if file == 'layer_definitions.json':
                    checked += 1
                    full_path = os.path.join(root, file)
                    if migrate_layer_definitions(full_path):
                        count += 1

    print(f"Migration complete. Scanned {checked} files. Updated {count} files.")

def main():
    """
    Main entry point for the migration script.
    
    Determines the workspace root relative to this script's location
    and initiates the scan and migrate process.
    """
    # Calculate workspace root. 
    # This script is located at: riverscapes_metadata/non-core_helpers/migrate_authority_name.py
    # So workspace root is two levels up from the script's directory (parent of 'riverscapes_metadata').
    current_script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # ../../ from riverscapes_metadata/non-core_helpers
    workspace_root = os.path.abspath(os.path.join(current_script_dir, '..', '..'))
    
    print(f"Starting migration scan from workspace root: {workspace_root}")
    scan_and_migrate([workspace_root])

if __name__ == "__main__":
    main()
