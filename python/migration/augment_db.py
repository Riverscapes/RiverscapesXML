"""
"""
import os
from glob import glob
import pathlib
import sqlite3
import argparse
import shutil
from lxml import etree
from migration.logger import Logger
from migration.util import dict_factory


def get_suffix(path_str: str):
    """We want the full file suffix (so for aaaaaaa/bbbbbb.cccccc/ddddddd.tif.xml we want .tif.xml)

    Args:
        path_str (str): _description_

    Returns:
        _type_: _description_
    """
    try:
        return '.'.join(path_str.split('/')[-1].split('.')[1:]).lower()
    except Exception as e:
        raise Exception('fiding suffix for file: {}'.format(path_str))


def get_project_datasets(project_path):
    """_summary_

    Args:
        project_path (_type_): _description_
        project_id (_type_): _description_

    Returns:
        _type_: _description_
    """
    log = Logger('check_file')

    # log.info(f"{project['id']} -- {project_path}")

    xml_tree = etree.parse(project_path)

    datasets = []
    datasets_containers = [
        "//Realization/Logs/*",
        "//Project/CommonDatasets/*",
        "//Realization/Datasets/*",
        "//Realization/Inputs/*",
        "//Realization/Outputs/*",
        "//Realization/Intermediates/*",
        "//Analysis/Configuration/*",
        "//Analysis/Products/*"
    ]
    # id,projectId,xmlNodeTag,xmlId,xPath,localPath
    new_db_data = []
    for container in datasets_containers:
        datasets.extend(list(xml_tree.xpath(container)))

    for dataset in datasets:
        if dataset.tag in ['CommonDatasetRef']:
            continue
        ds = get_dataset_info(dataset, project_path)
        if ds is not None:
            new_db_data.append(ds)

    return new_db_data


def get_dataset_info(dataset_elem, project_path):
    """_summary_

    Args:
        dataset_elem (_type_): _description_
        tree (_type_): _description_
        proj_id (_type_): _description_
        db_id (_type_): _description_
        rel_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    log = Logger('get_dataset_info')
    dataset_info = {}

    dataset_info['xmlNodeTag'] = dataset_elem.tag

    if "id" in dataset_elem.attrib:
        dataset_info['xmlId'] = dataset_elem.attrib["id"]
    else:
        dataset_info['xmlId'] = None

    dataset_info['xPath'] = get_rsxpath(dataset_elem)

    has_path = False
    for element in list(dataset_elem):
        if element.tag == "Path":
            dataset_info['localPath'] = element.text
            has_path = True
            break
    if not has_path:
        dataset_info['localPath'] = None

    file_suffix = get_suffix(dataset_info['localPath'])
    dataset_info['newFilePath'] = dataset_info['xPath'] + '.' + file_suffix

    return dataset_info


def get_rsxpath(elem):
    """_summary_

    Args:
        elem (_type_): _description_

    Returns:
        _type_: _description_
    """

    rsxpath_arr = []
    while elem is not None:
        curr_dir = elem.tag
        if "id" in elem.attrib:
            curr_dir += "#" + elem.attrib["id"]
        rsxpath_arr = [curr_dir, *rsxpath_arr]
        elem = elem.getparent()
    rsxpath = '/'.join(rsxpath_arr)
    return rsxpath


def match_files_with_datasets_pid(conn, curs, project):
    """_summary_

    Args:
        curs (_type_): _description_
        conn (_type_): _description_

    Returns:
        _type_: _description_
    """
    log = Logger('match_files_with_datasets_pid')
    proj_files_id_link = []
    match_count = 0
    in_proj_files_but_not_in_datasets_count = 0
    ignored_file_count = 0
    img_count_not_found = 0
    dir_only_count = 0
    unsupported_file_count = 0
    sidecar_extensions = ["shp", "tif", "tiff", "img"]
    sidecars = {
        'shp': ['shx', 'dbf', 'sbn', 'sbx', 'fbn', 'fbx', 'ain', 'aih', 'atx', 'ixs', 'mxs', 'prj', 'xml', 'cpg'],
        'tiff': ['aux.xml', 'tiff.*', 'tfw'],
        'tif': ['aux.xml', 'tif.*', 'tfw'],
        'img': ['img.*'],
    }

    file_rel_path = ""
    ds_rel_path = ""

    # 1. Get all the files for this project
    curs.execute("SELECT * FROM projectFiles WHERE projectId = ?",
                 [project["id"]])
    proj_files = curs.fetchall()

    # Get all the Datasets from the XML for this project
    curs.execute("SELECT * FROM datasets WHERE projectId = ?", [project["id"]])
    datasets = curs.fetchall()

    for _idx, proj_file in enumerate(proj_files):
        error_msg_arr = []
        status_arr = []
        proj_file_id = proj_file['id']
        ds_id = None
        new_path = None
        dataset_matches = []

        if proj_file['relPath'] == "rs_context.html":
            pass

        is_ignored = False
        found_match = False
        file_rel_path = proj_file['relPath']
        file_rel_path_l = file_rel_path.lower()
        suffix = get_suffix(proj_file['relPath'])

        # Check for some common problems
        if "\\" in file_rel_path_l:
            error_msg_arr.append("CONTAINS_BACK_SLASHES")
            file_rel_path_l = file_rel_path_l.replace("\\", "/")
        if " " in file_rel_path_l:
            error_msg_arr.append("CONTAINS_SPACES")
            file_rel_path_l = file_rel_path_l.replace(" ", "_")
        if "\t" in file_rel_path_l or "\n" in file_rel_path_l:
            error_msg_arr.append("CONTAINS_TABS_OR_NEW_LINES")
            file_rel_path_l = file_rel_path_l.strip()

        if 'tin' in file_rel_path:
            pass

        if file_rel_path == "project.rs.xml" or file_rel_path == "project_bounds.geojson":
            ignored_file_count += 1
            is_ignored = True
            new_path = file_rel_path_l

            status_arr.append("IGNORED_FILE")
        else:
            for _idj, dataset in enumerate(datasets):
                ds_rel_path = dataset['localPath'].lower()
                if file_rel_path == ds_rel_path:
                    match_count += 1
                    found_match = True
                    dataset_matches.append(dataset)
                    break
                else:
                    ds_rel_path_l = ds_rel_path.lower()
                    ds_ext = ds_rel_path_l[ds_rel_path_l.find(
                        ".") + 1:len(ds_rel_path_l)]
                    f_ext = file_rel_path_l[file_rel_path_l.find(
                        ".") + 1:len(file_rel_path_l)]

                    if file_rel_path_l == ds_rel_path_l:
                        match_count += 1
                        found_match = True
                        dataset_matches.append(dataset)
                        break
                    elif ds_ext in sidecars and file_rel_path_l[0:file_rel_path_l.find(".")] == ds_rel_path_l[0:ds_rel_path_l.find(".")]:
                        match_count += 1
                        if ds_ext in sidecars and f_ext in sidecars[ds_ext] or f_ext.startswith(ds_ext):
                            found_match = True
                            dataset_matches.append(dataset)
                            status_arr.append("SIDECAR")
                            break

                    elif file_rel_path_l.startswith(ds_rel_path_l):
                        match_count += 1
                        # dir_only_count
                        found_match = True
                        dataset_matches.append(dataset)
                        error_msg_arr.append("TIN")
                        break
                    elif ds_rel_path_l.endswith(file_rel_path_l):
                        match_count += 1
                        # dir_only_count
                        found_match = True
                        dataset_matches.append(dataset)
                        error_msg_arr.append("FILE_IN_DIFFERENT_DIR")
                        break

            deduped_ds_matches = list(dict.fromkeys(
                [row['id'] for row in dataset_matches]))
            if len(deduped_ds_matches) > 1:
                error_msg_arr.append(
                    f"DUPLICATE_DATASETS::{':'.join(deduped_ds_matches)}")
            elif found_match is True:
                ds_id = deduped_ds_matches[0]
                new_path = f"{dataset_matches[0]['xPath']}.{suffix}"
                status_arr.append('SUCCESS')

        if not found_match and not is_ignored:
            in_proj_files_but_not_in_datasets_count += 1

        error_msg = ','.join(list(dict.fromkeys(error_msg_arr))) if len(
            error_msg_arr) > 0 else None
        status_msg = ','.join(list(dict.fromkeys(status_arr))) if len(
            status_arr) > 0 else None

        curs.execute("""
            UPDATE projectFiles SET
                error = ?,
                status = ?,
                new_path = ?,
                dataset_id = ?
            WHERE id = ?
            """, [error_msg, status_msg, new_path, ds_id, proj_file_id])

    # f.close
    conn.commit()
    # log.info(f"MC: {match_count}\n")
    return proj_files_id_link


def match_datasets_with_files(conn, curs, project):
    """_summary_

    Args:
        curs (_type_): _description_
        conn (_type_): _description_

    Returns:
        _type_: _description_
    """
    log = Logger('match_datasets_with_files')
    proj_files_id_link = []
    errors = []
    match_count = 0
    in_proj_files_but_not_in_datasets_count = 0
    # ignored_file_count = 0
    # img_count_not_found = 0
    dir_only_count = 0
    # National datasets
    not_found = []

    # Get all project files for a project
    curs.execute("SELECT * FROM projectFiles where projectId = ?",
                 [project["id"]])
    project_files = curs.fetchall()

    # Get all datasets for a project
    curs.execute("SELECT * FROM datasets where projectId = ?", [project["id"]])
    datasets = curs.fetchall()

    for _idx, ds in enumerate(datasets):
        found_match = False
        ds_rel_path = ds['localPath'].replace(
            "\\", "/").replace(" ", "_").lower()

        for _idy, proj_file in enumerate(project_files):
            pf_rel_path = proj_file['relPath'].replace(
                "\\", "/").replace(" ", "_").lower()
            if ds_rel_path == pf_rel_path:
                proj_files_id_link.append([ds['id'], proj_file['id']])
                match_count += 1
                found_match = True
                break
            elif ds_rel_path[0:ds_rel_path.find(".")] == pf_rel_path[0:pf_rel_path.find(".")]:
                proj_files_id_link.append([ds['id'], proj_file['id']])
                match_count += 1
                found_match = True
                break
            elif pf_rel_path.startswith(ds_rel_path):
                match_count += 1
                dir_only_count
                found_match = True
                break
            elif ds_rel_path.endswith(pf_rel_path):
                match_count += 1
                dir_only_count
                found_match = True
                break

        if len(project_files) == 0:
            # log.info(f"No results for project ID in datasets. {ds['projectId']}")
            errors.append('NO_FILES_FOUND')
        # else:
        #     log.info(f"{ds['projectId']}, {found_match}, DS:, {ds['id']}, {ds['localPath']} PF: {proj_file['id']}, {proj_file['relPath']}")

        if not found_match:
            in_proj_files_but_not_in_datasets_count += 1
            not_found += ds_rel_path

        if len(errors) > 0:
            error_msg = ','.join(list(dict.fromkeys(errors))
                                 ) if len(errors) > 0 else None
            curs.execute("""
                UPDATE datasets SET
                    error = ?,
                WHERE id = ?
                """, [error_msg, ds['id']])
            conn.commit()

    # f.close
    # log.info(not_found)
    # log.info("MC: " + str(match_count))
    # log.info("")
    return proj_files_id_link


def add_link_to_db(db_links, curs):
    """_summary_

    Args:
        db_links (_type_): _description_
        curs (_type_): _description_
    """
    log = Logger('add_link_to_db')
    for i in range(len(db_links)):
        qry = "UPDATE projectFiles SET dataset_id = " + \
            db_links[i][1] + " WHERE id = " + db_links[i][0]
        log.info(qry)
        curs.execute(qry)


def comment_out_missing_files(conn, curs, wh_xml):
    """_summary_

    Args:
        conn (_type_): _description_
        curs (_type_): _description_
        wh_xml (_type_): _description_
    """
    log = Logger('comment_out_missing_files')
    project_dirs = glob(wh_xml + "/*/", recursive=False)

    curs.execute("SELECT d.id, p.projType, p.program, p.guid, xmlNodeTag, xmlId, xPath, localPath, newFilePath from datasets d LEFT JOIN projects p on p.id = d.projectId WHERE d.id not in (SELECT dataset_id from projectFiles WHERE dataset_id is not NULL group by dataset_id) AND xmlNodeTag is not 'CommonDatasetRef';")

    proj_len = len(project_dirs)
    ds_with_no_f = list(curs.fetchall())

    for j in enumerate(ds_with_no_f):
        xml_path = os.path.join(
            wh_xml, ds_with_no_f[j]['guid'], "project.rs.xml")
        log.info(str(j + 1) + "/" + str(proj_len), xml_path)
        xml_tree = etree.parse(xml_path)

        x = xml_tree.xpath(
            "//" + ds_with_no_f[j]["xmlNodeTag"] + "[@id='" + ds_with_no_f[j]["xmlId"] + "']")
        if len(x) == 0:
            pass
        elif len(x) > 1:
            p = pathlib.Path(ds_with_no_f[j]["xPath"])
            result = p.parts

            outer_dir = result[3][result[3].find("#") + 1:len(result[3])]

            x = xml_tree.xpath("//" + "Realization" + "[@id='" + outer_dir + "']/" + result[4] +
                               "/" + ds_with_no_f[j]["xmlNodeTag"] + "[@id='" + ds_with_no_f[j]["xmlId"] + "']")
            if len(x) != 1:
                pass
            else:
                commented = x[0]
                commented.getparent().replace(commented, etree.Comment(etree.tostring(commented)))
                xml_tree.write(xml_path)

        else:
            commented = x[0]
            commented.getparent().replace(commented, etree.Comment(etree.tostring(commented)))
            breakpoint
            xml_tree.write(xml_path)
        breakpoint

    return


def create_db_copy(db_rel_old_path: str, reset: bool = False):
    """_summary_

    Args:
        db_rel_old_path (str): _description_
        reset (False): _description_

    Returns:
        _type_: _description_
    """
    log = Logger('create_db_copy')

    if 'DATA_XML' not in os.environ or len(os.environ['DATA_XML']) < 5 or not os.path.isdir(os.environ['DATA_XML']):
        raise Exception(
            'environment value DATA_XML was not a valid folder:' + os.environ['DATA_XML'])

    db_old_path = os.path.join(os.environ['DATA_XML'], db_rel_old_path)
    db_path_new = os.path.join(
        os.environ['DATA_XML'], f"{os.path.basename(db_rel_old_path)}_MIGRATION.sqlite")

    if (os.path.isfile(db_path_new) and reset is True):
        log.info('file detected and reset is True. Deleting migration sqliteDB')
        os.remove(db_path_new)

    if not os.path.isfile(db_path_new):
        log.info(f'(re)creating db: {db_path_new}')
        shutil.copyfile(db_old_path, db_path_new)
        # Add any new tables we might need
        add_new_tables(db_path_new)

    conn = sqlite3.connect(db_path_new)
    conn.row_factory = dict_factory
    curs = conn.cursor()

    # Some of the data is dirty and we need to clean it
    for subst in ['Solar', 'EC', 'QRF']:
        curs.execute("UPDATE projects SET projType = ? WHERE projType LIKE ?", [
                     subst, '%' + subst + '%'])
        conn.commit()
    # If we've explicitly asked for a reset then nullify the apporpriate columns
    if reset is True:
        curs.execute("UPDATE projectFiles SET dataset_id = null, error = null")
        curs.execute("UPDATE projects SET migration_status = null")
        conn.commit()
    return db_path_new


def add_new_tables(db_path_new: str):
    """We need a few more tables and columns than what the default db has

    Args:
        db_path_new (str): _description_
    """
    conn = sqlite3.connect(db_path_new)
    conn.row_factory = dict_factory
    curs = conn.cursor()

    curs.execute("DROP TABLE IF EXISTS datasets;")
    curs.execute("""
        CREATE TABLE datasets (
            id integer PRIMARY KEY,
            projectId integer KEY,
            xmlNodeTag text,
            xmlId text,
            xPath text,
            localPath text,
            newFilePath text,
            error text
            status text
        );
    """)
    try:
        curs.execute("ALTER TABLE projectFiles ADD COLUMN dataset_id")
        curs.execute("ALTER TABLE projectFiles ADD COLUMN error text")
        curs.execute("ALTER TABLE projectFiles ADD COLUMN status text")
        curs.execute("ALTER TABLE projectFiles ADD COLUMN new_path text")
        curs.execute("ALTER TABLE projects ADD COLUMN migration_status text")
        curs.execute("ALTER TABLE projects ADD COLUMN migration_msg text")
    except Exception as e:
        pass

    curs.close()


def main():
    log = Logger("Link Files")
    parser = argparse.ArgumentParser()
    parser.add_argument('db_path', help='Original DB', type=str)
    parser.add_argument('migrated_xml_folder', help='Original DB', type=str)
    parser.add_argument('--reset', help='(optional) reset the migration and start over from scratch',
                        action='store_true', default=False)

    args = parser.parse_args()
    # Make a new copy of the Database so we don't affect the original
    new_warehouse_xml = os.path.join(
        os.environ['DATA_XML'], f"{os.path.basename(args.db_path)}_MIGRATION")

    db_path_new = create_db_copy(os.path.join(
        os.environ['DATA_XML'], args.db_path), os.path.join(os.environ['DATA_XML'], args.db_path))

    conn = sqlite3.connect(db_path_new)
    conn.row_factory = dict_factory
    curs = conn.cursor()

    curs.execute("select * from projects;")
    projects = curs.fetchall()

    new_entry_data = {}

    for _idx, project in enumerate(projects):
        log.info(f"List: {_idx+1}/{len(projects)}")
        project_xml_path = os.path.join(
            new_warehouse_xml, project['guid'], "project.rs.xml")
        try:
            new_entry_data[project['id']] = get_project_datasets(
                project_xml_path, project["id"], len(new_entry_data) + 1, project['guid'])
        except Exception as ex:
            log.error("Failed to gather row data: " + str(ex))

    for _idx, new_data in enumerate(new_entry_data):
        curs.execute("""
            INSERT INTO datasets
            (id, projectId, xmlNodeTag, xmlId, xPath, localPath, newFilePath)
            VALUES(?,?,?,?,?,?,?);
        """, [])
        log.info("DB: " + str(new_data + 1) + "/" + str(len(new_entry_data)))
    conn.commit()

    wh = os.path.join(os.environ['DATA_XML'], args.new_warehouse_xml, "p")
    db_links = match_files_with_datasets_pid(curs, conn, wh)
    match_datasets_with_files(curs, conn)

    add_link_to_db(db_links, curs)
    curs.execute("select id,projectId,localPath from datasets")
    datasets = [row for row in curs.fetchall()]

    # curs.execute("select id,projectId,relpath from projectFiles")
    # project_files = [row for row in curs.fetchall()]
    # match_files_with_datasets(project_files, datasets)

    log.info("Efe5")

    comment_out_missing_files(conn, curs, wh)


if __name__ == '__main__':
    main()
