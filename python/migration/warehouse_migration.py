import math
import os
import sys
import shutil
import traceback
import sqlite3
import argparse
import inquirer
import time
from migration.augment_db import add_link_to_db, get_project_datasets, create_db_copy, match_datasets_with_files, match_files_with_datasets_pid
from migration.logger import Logger
from migration.migration_summary import create_summary
from migration.util import dict_factory
from migration.xml_conversion import convert_xml
from validate import get_xml, get_xsd, validate_xml


# Hardcode the XSD to be the one in this repo
XSD_PATH = os.path.join(os.path.dirname(__file__), "..", "..", "Projects", "XSD", "V2", "RiverscapesProject.xsd")
XSD_STR = get_xsd(XSD_PATH)


class MIGRATION_STATUS:
    SUCCESS = "SUCCESS"
    FAIL = "FAIL"
    SKIPPED = "SKIPPED"


def process_project(conn, curs, project_row, old_warehouse_xml, new_warehouse_xml, watersheds_db_path, champ_db_path):
    """_summary_

    Args:
        conn (_type_): _description_
        project_row (_type_): _description_
        old_warehouse_xml (_type_): _description_
        new_warehouse_xml (_type_): _description_
        watersheds_db_path (_type_): _description_
        champ_db_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    log = Logger("process_project")

    # Some projType strings have multiple \n and \t chars, making them differ from the actual dir names
    formatted_proj_type = project_row['projType'].replace("\n", "").replace("\t", "").replace("\r", "")

    old_project_xml = os.path.join(old_warehouse_xml, project_row['program'], formatted_proj_type, project_row['guid'], "project.rs.xml")
    new_project_xml = os.path.join(new_warehouse_xml, project_row['guid'], "project.rs.xml")

    # So I can more easily find files while testing. Sorts dirs into project types like in the old file system
    # temp_new_project_xml = os.path.join(new_warehouse_xml, project_row['program'], formatted_proj_type, project_row['guid'], "project.rs.xml")
    # print("   STARTING: " + old_project_xml)

    try:
        if not os.path.isfile(old_project_xml):
            raise Exception('Origin XML not found: ' + old_project_xml)
        # 1. Convert froim the old XML to the new XML
        convert_xml(old_project_xml, new_project_xml, formatted_proj_type, old_warehouse_xml, new_warehouse_xml, watersheds_db_path, champ_db_path)

        # 2. Validate the XML with the new XSD
        result, validation_error = validate_xml(get_xml(new_project_xml), XSD_STR)

        # 3. Check the datasets and create new S3 paths
        project_datasets = get_project_datasets(new_project_xml, project)

        # 4. Create a record for these datasets
        for _idx, new_data in enumerate(project_datasets):
            curs.execute("""
                INSERT INTO datasets
                (projectId, xmlNodeTag, xmlId, xPath, localPath, newFilePath)
                VALUES(?,?,?,?,?,?);
            """, [
                project['id'],
                new_data['xmlNodeTag'],
                new_data['xmlId'],
                new_data['xPath'],
                new_data['localPath'],
                new_data['newFilePath']
            ])
            # log.info(f"   Dataset: {_idx + 1}/{len(project_datasets)}")
        conn.commit()

        db_links = match_files_with_datasets_pid(conn, curs, project)
        match_datasets_with_files(conn, curs, project)

        add_link_to_db(db_links, curs)

        if not result:
            raise Exception("FAILED TO VALIDATE: " + str(validation_error))

        update_project_status(project['id'], MIGRATION_STATUS.SUCCESS)
    except Exception as ex:
        log.error(str(ex))
        traceback.print_exc(file=sys.stdout)
        update_project_status(project['id'], MIGRATION_STATUS.FAIL, str(ex))


def update_project_status(projectId: int, statusEnum: str, msg: str = None):
    """We track the migration status in the DB so that we can resume or re-run them
    and query errors later

    Args:
        projectId (int): _description_
        statusEnum (str): _description_
        msg (str): _description_
    """
    curs.execute("UPDATE projects SET migration_status = ?, migration_msg = ? WHERE id = ?", [statusEnum, msg, projectId])
    conn.commit()


if __name__ == '__main__':
    """_summary_
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('db_path', help='SQLite database path', type=str)
    parser.add_argument('old_warehouse_xml', help='Old warehouse project XML top level folder', type=str)
    parser.add_argument('new_warehouse_xml', help='New warehouse project XML top level folder', type=str)
    parser.add_argument('watersheds_db_path', help='Watersheds and Riverscapes SQLite database path', type=str)
    parser.add_argument('champ_db_path', help='CHaMP SQLite database path', type=str)
    parser.add_argument('--reset', help='(optional) reset the migration and start over from scratch', action='store_true', default=False)
    # parser.add_argument('csv_path', help='CSV data', type=str)
    args = parser.parse_args()

    log = Logger('Riverscapes Warehouse Migration')
    logfile = os.path.join(os.environ['DATA_XML'], "logs", "riverscapes_warehouse_{}.log".format(time.strftime("%Y_%m_%d_%H%M%S")))
    if not os.path.isdir(os.path.dirname(logfile)):
        os.makedirs(os.path.dirname(logfile))
    log.setup(logPath=logfile, verbose=True)

    db_path = os.path.join(os.environ['DATA_XML'], args.db_path)
    watersheds_db_path = os.path.join(os.environ['DATA_XML'], args.watersheds_db_path)
    champ_db_path = os.path.join(os.environ['DATA_XML'], args.champ_db_path)

    old_warehouse_xml = os.path.join(os.environ['DATA_XML'], args.old_warehouse_xml)
    new_warehouse_xml = os.path.join(os.environ['DATA_XML'], args.new_warehouse_xml)

    if not os.path.isfile(db_path):
        raise Exception(f'ERROR: Could not find db_path at: {db_path}')

    if not os.path.isdir(old_warehouse_xml):
        raise Exception(f'ERROR: Could not find old_warehouse_xml at: {old_warehouse_xml}')

    if os.path.isdir(old_warehouse_xml) and args.reset is True:
        log.info('RESET called!!! Wiping all Dbs and folders')
        shutil.rmtree(old_warehouse_xml)

    if not os.path.isfile(watersheds_db_path):
        raise Exception(f'ERROR: Could not find watersheds_db_path at: {watersheds_db_path}')

    if not os.path.isfile(champ_db_path):
        raise Exception(f'ERROR: Could not find champ_db_path at: {champ_db_path}')

    new_db_path = create_db_copy(args.db_path, args.reset)

    conn = sqlite3.connect(new_db_path)
    conn.row_factory = dict_factory
    curs = conn.cursor()

    curs.execute("""
        SELECT COUNT(*) as count FROM projects
    """)
    proj_total = curs.fetchone()['count']

    curs.execute("""
        SELECT COUNT(*) as count, migration_status FROM projects GROUP BY migration_status
    """)
    status_stats = curs.fetchall()

    migration_status_q = inquirer.prompt([
        inquirer.List('migration_status',
                      message="Migrate projects with what status?",
                      choices=[
                          (f'ALL ({proj_total})', 'ALL'),
                          *[(f'{row["migration_status"]} ({row["count"]})', row["migration_status"]) for row in status_stats],
                      ]
                      ),
    ])['migration_status']

    if migration_status_q == 'ALL':
        curs.execute("""
            SELECT COUNT(*) as count, projType FROM projects
                GROUP BY projType
        """)
    elif migration_status_q is None:
        curs.execute("""
            SELECT COUNT(*) as count, projType FROM projects
                WHERE migration_status is null
                GROUP BY projType
        """)
    else:
        curs.execute("""
            SELECT COUNT(*) as count, projType FROM projects
                WHERE migration_status = ?
                GROUP BY projType
        """, [migration_status_q])
    proj_type_stats = curs.fetchall()

    proj_type_total = sum([row['count'] for row in proj_type_stats])
    proj_type_q = inquirer.prompt([
        inquirer.Checkbox('proj_type',
                          message="Which Project Types?",
                          choices=[
                              (f'ALL ({proj_total})', 'ALL'),
                              *[(f'{row["projType"]} ({row["count"]})', row["projType"]) for row in proj_type_stats],
                          ],
                          carousel=False
                          ),
    ])['proj_type']

    if len(proj_type_q) == 0:
        raise Exception('You need to choose')
    elif 'ALL' in proj_type_q and len(proj_type_q) > 1:
        raise Exception('ALL needs to be used alone')

    proj_type_str = '(' + ','.join([f"'{x}'" for x in proj_type_q]) + ')'
    if migration_status_q == 'ALL':
        if 'ALL' in proj_type_q:
            curs.execute("SELECT * from projects")
        else:
            curs.execute(f"SELECT * from projects WHERE projType in {proj_type_str}")
    elif migration_status_q is None:
        if 'ALL' in proj_type_q:
            curs.execute("SELECT * from projects WHERE migration_status is null")
        else:
            curs.execute(f"SELECT * from projects WHERE migration_status is null and projType in {proj_type_str}")
    else:
        if 'ALL' in proj_type_q:
            curs.execute("SELECT * from projects WHERE migration_status = ?", [migration_status_q])
        else:
            curs.execute(f"SELECT * from projects WHERE migration_status = ? AND projType in {proj_type_str}", [migration_status_q])

    projects = curs.fetchall()

    proj_len = len(projects)
    # for _idx, project in enumerate(projects):
    #     log.info(f"Processing project {_idx+1}/{len(projects)}: [{project['program']}][{project['HUC8']}] {project['name']}")
    #     process_project(conn, curs, project, old_warehouse_xml, new_warehouse_xml, watersheds_db_path, champ_db_path)

    create_summary(conn, curs)
