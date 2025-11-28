"""
Fall 2025, we have found ~ 30 Yankee Fork topo projects on S3 that need to be
migrated to the new Data Exchange. These are post-ChaMP, 2018, 2019 and 2020 sites
that Boyd Bouwes collected.

This script is intended to loop over these sites and migrate them to the new
project.rs.xml structure, using the old Python that Matt and Tyler Kunz wrote
to migrate projects from the old Warehouse to the new format.

Philip Bailey
27 Nov 2025
"""
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

# This was a temporary DB that Philip built for Tyler Kunz to use to migrate
# Yankee Fork sites. It contains the Yankee Fork bounds polygon.
# In 2025 Philip wrote a temporary script in PyDex repo to generate a new SQLite
# db with the same schema with just the Yankee Fork bounds to migrate post-ChaMP
# sites.
champ_db = "/Users/philipbailey/GISData/champ/yankee_fork_bounds/yankee_fork_bounds.sqlite"


def migrate_yankkee_fork_sites(parent_dir: str) -> None:

    # Recursively find all project.rs.xml files in the Yankee Fork sites
    project_files = []
    for dirpath, __dirnames, filenames in os.walk(parent_dir):
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

        # Load the original XML and skip if already migrated
        tree = ET.parse(project_file)
        orig_xml = tree.getroot()

        nod_migrated = orig_xml.find('MetaData/Meta[@name="MigratedOn"]')
        if nod_migrated is not None:
            print(f"Project already migrated, skipping: {project_file}")
            continue

        print(f"Migrating project: {project_file}")
        try:
            # Copy the original_xml to a backup location if needed
            backup_file = os.path.join(os.path.dirname(project_file), "backup_project.xml")
            old_xml_path = os.path.join(os.path.dirname(project_file), "old_project.xml")

            # Copy the original project.rs.xml to old_project.rs.xml and also backup
            shutil.copy2(project_file, old_xml_path)
            shutil.copy2(project_file, backup_file)

            # Yankee Fork sites were processed by hand and don't always have the proper
            # visit and site info in the XML.
            fix_yankee_fork_project_xml(project_file)

            v2_xml = convert_topo(project_file, workbench_db, project_file, champ_bounds_db, project_file)

            # Cleaner format for the name field
            site = v2_xml.find('MetaData/Meta[@name="Site"]').text
            # visit = v2_xml.find('MetaData/Meta[@name="Visit"]').text
            year = v2_xml.find('MetaData/Meta[@name="Year"]').text
            v2_xml.find('Name').text = f"{year} Topo Project for {site}"

            v2_xml.find('MetaData/Meta[@name="Organization"]').text = "Watershed Solutions"
            v2_xml.find('MetaData/Meta[@name="SurveyCrew"]').text = "Boyd Bouwes"

            # Track that this was migrated from Yankee Fork
            migrated_on = ET.SubElement(v2_xml.find('MetaData'), 'Meta', attrib={'name': 'MigratedOn'})
            migrated_on.text = datetime.now().strftime("%Y-%m-%dT%H:%M:%SZ")

            # Still need to write the XML
            output_file = project_file  # + ".migrated"
            print(f"Writing migrated project XML to: {output_file}")
            v2_xml.write(output_file, encoding="utf-8", xml_declaration=True)

        except Exception as e:
            print(f"Failed to migrate project: {project_file}. Error: {str(e)}")


def fix_yankee_fork_project_xml(project_file: str) -> None:
    """
    Yankee Fork projects often have missing or incorrect site and visit info
    in their project.rs.xml files. This function attempts to fix those issues
    by reading the old_project.rs.xml file and updating the project_file accordingly.
    """

    # Extract site and visit info from old XML
    tree = ET.parse(project_file)
    root = tree.getroot()
    nod_site = root.find('MetaData/Meta[@name="Site"]')
    nod_visit = root.find('MetaData/Meta[@name="Visit"]')
    nod_title = root.find('Name')
    year = int(root.find('MetaData/Meta[@name="Year"]').text)

    with sqlite3.connect(workbench_db) as conn:
        curs = conn.cursor()
        print('***** Attempting to fix Yankee Fork project site and visit info *****')
        print(project_file)
        print(f'Site: {nod_site.text}')
        print(f'Visit: {nod_visit.text}')
        print(f'Year: {year}')

        curs.execute('SELECT * FROM CHaMP_Sites WHERE SiteName Like ?', [nod_site.text])
        site_row = curs.fetchone()

        curs.execute('SELECT * FROM CHaMP_Visits WHERE VisitID = ?', [nod_visit.text])
        visit_row = curs.fetchone()

        if site_row is None or visit_row is None:

            # Attempt regex to extract partial site and visit info
            site_match = re.search(r'^([0-9]*)-([0-9]{4})', nod_site.text)
            if site_match:
                print(f"Extracted site and visit from regex: {site_match.group(0)}")
                site_ending = site_match.group(1)
                visit_year = int(site_match.group(2))

                curs.execute('SELECT SiteName, VisitID FROM vwVisits WHERE SiteName Like ? AND VisitYear = ?', [f'%{site_ending}', visit_year])
                site_row = curs.fetchone()
                if site_row:
                    nod_site.text = site_row[0]
                    nod_visit.text = str(site_row[1])
                    nod_title.text = f"{visit_year} Topo Project for {nod_site.text}"

                    print(f"Updating XML site to {nod_site.text} and visit to {nod_visit.text} using regex extraction.")
                    tree.write(project_file, encoding="utf-8", xml_declaration=True)
                else:
                    print(f"Could not find site or visit in workbench DB for XML site name {nod_site.text}.")
            else:
                raise ValueError(f"Could not find site or visit info for project: {project_file}")
        else:
            print(f"Site {nod_site.text} and visit {nod_visit.text} info already valid for project: {project_file}")


if __name__ == "__main__":
    migrate_yankkee_fork_sites(top_level_dir)
