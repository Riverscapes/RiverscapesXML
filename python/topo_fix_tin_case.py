from pathlib import Path
import re
import os
import shutil
import sqlite3
from datetime import datetime
import xml.etree.ElementTree as ET
from migration.xml_conversion import convert_topo

top_level_dir = "/Users/philipbailey/GISData/champ/MonitoringDataUnzipped"
workbench_db = "/Users/philipbailey/GISData/champ/workbench.db"
champ_bounds_db = "/Users/philipbailey/GISData/champ/champ_visit_bounds2.sqlite"


def fix_path_case(path) -> str:
    p = Path(path)
    if not p.exists():
        return None

    parts = p.parts
    corrected = Path(parts[0])   # start with the root (/ or C:\)

    for part in parts[1:]:
        entries = os.listdir(corrected)
        # match ignoring case
        for e in entries:
            if e.lower() == part.lower():
                corrected = corrected / e
                break
        else:
            # fallback if not found (shouldn't happen if path exists)
            corrected = corrected / part

    # return path as string
    return str(corrected)


def remove_node_by_reference(root, child):
    """
    Removes the given child node from its parent in the XML tree.
    Returns True if removed, False if not found.
    """
    for parent in root.iter():
        for node in list(parent):
            if node is child:
                parent.remove(child)
                return True
    return False


# Recursively find all project.rs.xml files in the Yankee Fork sites
project_files = []
for dirpath, __dirnames, filenames in os.walk(top_level_dir):
    for filename in filenames:
        if filename == "project.rs.xml":
            project_files.append(os.path.join(dirpath, filename))

# Remove any projects that don't contain "Yankee Fork" in their path
# because the folder might contain other post-champ surveys, surch as Humboldt County etc
print(f"Found {len(project_files)} total projects.")
yankee_fork_projects = [pf for pf in project_files if "YankeeFork" in pf]
print(f"Found {len(yankee_fork_projects)} Yankee Fork projects to migrate.")

# Loop over each project and migrate it
for project_file in yankee_fork_projects:

    project_dir = os.path.dirname(project_file)

    # Load the original XML and skip if already migrated
    tree = ET.parse(project_file)
    orig_xml = tree.getroot()

    changes_made = False

    for tin_xpath in [
        'Realizations/Realization/Inputs/TIN',
        'Realizations/Realization/Outputs/TIN',
    ]:
        nod_tins = orig_xml.findall(tin_xpath)
        for nod_tin in nod_tins:
            if nod_tin is None:
                print(f"No {tin_xpath} TIN found, skipping: {project_file}")
                continue

            tin_path = os.path.join(project_dir, nod_tin.find('Path').text)
            new_path = fix_path_case(tin_path)
            if new_path is None:
                remove_node_by_reference(orig_xml, nod_tin)
                print(f"Removed TIN with missing path: {tin_path}")
                changes_made = True
            elif tin_path != str(new_path):
                print(f"Fixed path case: {tin_path} -> {new_path}")
                nod_tin.find('Path').text = os.path.relpath(new_path, project_dir)
                changes_made = True

    if changes_made:
        print(f"Migrating project: {project_file}")
        tree.write(project_file, encoding="utf-8", xml_declaration=True)
