"""
This script reads in an XML file and validates the file with the files in the corresponding directory.
The following data is logged:
    - Sidecar files
    - Files that are not relevant to the XML file
    - Files found in the XML file but not the directory
    - Files found in the directory but not the XML file
"""
from os import path
import xml.etree.ElementTree as ET
from pathlib import Path
import argparse

from migration.logger import Logger
# from dotenv import parse_args_env


def check_dir(project_dir, file_list):
    """
    Checks for sidecar and irrelevant files in working directory. Returns list of relevant files for XML validation.
    """
    log = Logger("check_dir")

    # file_list = glob.glob(join(project_dir, "**"), recursive = True)
    files = []              # Files that should be in the XML file
    files_no_suffix = []    # Filenames. No suffix. No path. Used to identify sidecar files
    other_files = []        # File paths that wouldn't have sidecar files but should still be in the XML file
    irrelevant_files = []   # Files that are not important for XML validation

    # Checks if path is a file and determines which of the above categories to sort the paths into
    for fpath in file_list:
        # if isfile(f):
        fpath_cls = Path(fpath)
        file_name, suffix = path.splitext(path.basename(fpath_cls.name))
        # relative_p = relpath(f, project_dir)
        relative_p = fpath
        if suffix.lower() == ".tif" or suffix.lower() == ".shp":
            files.append(Path(path.normcase(path.normpath(relative_p))))
            files_no_suffix.append(path.normcase(path.normpath(file_name)))
        elif suffix.lower() == ".xml" or suffix.lower() == ".png" or suffix.lower() == ".jpg":
            irrelevant_files.append(path.normcase(path.normpath(relative_p)))
        else:
            other_files.append(path.normcase(path.normpath(relative_p)))

    # Identifies sidecar files and logs info
    side_car_files = []
    for fpath in other_files:
        fpath_cls = Path(fpath)
        f_str = fpath_cls.name[0:fpath_cls.name.index(".")]
        if f_str in files_no_suffix:
            side_car_files.append(fpath)
        else:
            files.append(Path(fpath))

    is_printed = False
    log_str = "\nSide Car Files:\n"

    for sidecar_file in side_car_files:
        # log_str += "\t" + x + "\n"
        is_printed = True
    if is_printed:
        log_str += str(len(side_car_files))
        log.info("\t" + str(log_str))

    # Logs irrelevant files
    is_printed = False
    log_str = "\nIrrelevant Files:\n"

    for sidecar_file in irrelevant_files:
        # log_str += "\t" + x + "\n"
        is_printed = True
    if is_printed:
        log_str += str(len(irrelevant_files))
        log.info("\t" + str(log_str))

    return files


def validate_xml(xml_file, db_files):
    """
    Compares files in directory to files found in XML file
    """
    log = Logger("XML Validation")
    log.info(xml_file)
    project_dir = path.dirname(xml_file)
    files_in_dir = check_dir(project_dir, db_files)

    files_in_xml = []   # Files found in XML file
    xml_tree = ET.parse(xml_file)

    is_in_vector = False
    # Finds all Path elements and file paths within the element to an array
    for elem in xml_tree.iter():
        if elem.tag == "Vector":
            is_in_vector = True
        if elem.tag == "Path":
            if is_in_vector:
                # Needs better method
                if "." in elem.text:
                    element_text = elem.text
                    element_text = element_text.replace("\n", "").replace("\t", "").replace("\r", "").replace("\\", "/")
                    files_in_xml.append(Path(element_text))

                is_in_vector = False

            else:
                element_text = elem.text
                element_text = element_text.replace("\n", "").replace("\t", "").replace("\r", "").replace("\\", "/")
                files_in_xml.append(Path(element_text))

    # TODO: Use findall() instead of the implementation above.
    # The code below does not work at the moment.
    # """
    # root = xml_tree.getroot()
    # files_in_xml = root.findall("Path")
    # files_in_xml = [normcase(normpath(f.text)) for f in files_in_xml]
    # """

    # Searches for files in directory but not in XML file and logs info
    is_printed = False
    log_str = "\nFiles in directory but not in " + xml_file + ":\n"

    for f in files_in_dir:
        if f not in files_in_xml:
            log_str += "\t" + str(f) + "\n"
            is_printed = True
    if is_printed:
        log.warning(log_str)

    # Searches for files in XML file but not in directory and logs info
    is_printed = False
    log_str = "\nFiles in " + xml_file + " but not in directory:\n"

    for f in files_in_xml:
        if f not in files_in_dir:
            log_str += "\t" + str(f) + "\n"
            is_printed = True
    if is_printed:
        log.warning(log_str)


def main():
    """_summary_
    """
    # Takes an arguement "--f" followed by an XML file path string
    # Ex: py validate.py --f "project_new_vbet.rs.xml"
    # If run without any arguement, the file defaults to "project.rs.xml"
    parser = argparse.ArgumentParser()
    parser.add_argument('--f', type=str, required=True)
    args = parser.parse_args()

    # args = parse_args_env(parser)

    log = Logger("Validate_Main")
    # log.setup(logPath=join(args.output, "rs_context.log"), verbose=args.verbose)
    log.info("TESTING")

    if args.f:
        validate_xml(args.f)
    else:
        validate_xml("project.rs.xml")


if __name__ == "__main__":
    main()
