"""_summary_

Returns:
    _type_: _description_
"""
from os import path, makedirs, environ, remove
import json
import shutil
import random
import sqlite3
import argparse
import xml.etree.ElementTree as ET

from migration.logger import Logger
from migration.util import dict_factory

# Project types are similar to one another so we group them into lumps that all convert the same
# sort of way
CONVERSIONS = {
    "STANDARD": ["VBET", "BRAT", "ChannelArea", "TauDEM", "LST", "pyBRAT", "Confinement", "fmLTPBR", "PBR"],
    "STREAM": ["STREAMTEMPMIN", "STREAMTEMPPOTMEAN", "STREAMTEMPMEAN", "STREAMTEMPPOTMAX", "STREAMTEMPMAX", "Substrate"],
    "SOLAR": ["Solar", "EC", "QRF", "GUT"],
    "NOT_BUILD": ["CHAMPMETRICS", "MHFD"]
}


def convert_xml(old_xml_path, new_xml_path, project_type, old_warehouse_xml, new_warehouse_xml, watersheds_db_path, champ_db_path):
    """_summary_

    Args:
        old_xml_path (_type_): _description_
        new_xml_path (_type_): _description_
        project_type (_type_): _description_
        old_warehouse_xml (_type_): _description_
        new_warehouse_xml (_type_): _description_
        watersheds_db_path (_type_): _description_
        champ_db_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    log = Logger("XML Conversion")
    new_xml_dir = path.dirname(new_xml_path)

    # Always start fresh
    if path.isdir(new_xml_dir):
        shutil.rmtree(new_xml_dir)
    makedirs(new_xml_dir)

    data = ""
    try:
        text_file = open(old_xml_path, "r")
        data = text_file.read()
    except Exception as ex:
        raise ex

    if data == "":
        raise Exception("XML file is empty")
    else:
        if project_type in CONVERSIONS["SOLAR"]:
            xml_tree = convert_solar(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type in CONVERSIONS["STREAM"]:
            xml_tree = convert_stream(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type in CONVERSIONS["STANDARD"]:
            xml_tree = convert_general(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)

        # Then for the reset we need individualized conversions
        elif project_type == "GUT":
            xml_tree = convert_gut(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "RVD":
            xml_tree = convert_rvd(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "GRTS":
            xml_tree = convert_grts(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "Topo":
            xml_tree = convert_topo(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "FHM":
            xml_tree = convert_fhm(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "Inundation":
            xml_tree = convert_inundation(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "GCD":
            xml_tree = convert_gcd(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "RSContext":
            xml_tree = convert_RSContext(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "RCA":
            xml_tree = convert_rca(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "Hydro":
            xml_tree = convert_hydro(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "CAD_Export":
            xml_tree = convert_cad(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "CHAMPMETRICS":
            xml_tree = convert_cm(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        elif project_type == "NationalDatasets":
            xml_tree = convert_nd(old_xml_path, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)

    xml_tree.write(new_xml_path)
    # log.info("New file successfully written to " + new_xml_path)

    return


def convert_test(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """Test method for working with new project formats

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)
        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        # insert_inputs_outputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_realization(element)
        move_tin_attribs_to_realization(element)
        format_product_version(element)
        format_analysis(element)
        replace_spaces_with_underscores(element)

    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)

    return xml_tree


def convert_grts(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """_summary_

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        # insert_inputs_outputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_realization(element)
        move_tin_attribs_to_realization(element)
        format_product_version(element)
        format_analysis(element)
        reformat_csv(element)
        replace_spaces_with_underscores(element)
        fix_hydro_common_ds_refs(element)

    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)

    return xml_tree


def convert_topo(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """_summary_

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        insert_inputs_outputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_realization(element)
        move_tin_attribs_to_realization(element)
        format_product_version(element)
        format_analysis(element)
        replace_spaces_with_underscores(element)

    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    format_ids_topo(xml_tree)
    fix_topo_tins(xml_tree)
    fix_breaklinedxf(xml_tree)
    return xml_tree


def convert_hydro(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """_summary_

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    log = Logger("Convert Hydro")
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        # insert_inputs_outputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_realization(element)
        move_tin_attribs_to_realization(element)
        format_product_version(element)
        format_analysis(element)
        replace_spaces_with_underscores(element)
        # fix_input_children(element)
        format_gut_csv(element)
        reformat_csv(element)
        format_common_data_inputs(element)
        fix_hydro_common_ds_refs(element)
    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    return xml_tree


def convert_cad(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """_summary_

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    log = Logger("Convert Hydro")
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        # insert_inputs_outputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_realization(element)
        move_tin_attribs_to_realization(element)
        format_product_version(element)
        format_analysis(element)
        replace_spaces_with_underscores(element)
        # fix_input_children(element)
        format_gut_csv(element)
        reformat_csv(element)
        format_common_data_inputs(element)
    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    remove_common_datasets(xml_tree)
    return xml_tree


def convert_rvd(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """_summary_

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        # insert_inputs_outputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_realization(element)
        move_tin_attribs_to_realization(element)
        format_product_version(element)
        format_analysis(element)
        replace_spaces_with_underscores(element)
        # fix_input_children(element)
        reformat_csv(element)
        format_inputs_children(element)
        format_realization_logfiles(element)

    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    format_vectors_rvd(xml_tree)

    return xml_tree


def convert_solar(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        # insert_inputs_outputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_realization(element)
        move_tin_attribs_to_realization(element)
        format_product_version(element)
        format_analysis(element)
        replace_spaces_with_underscores(element)
        # fix_input_children(element)
        reformat_csv(element)
        format_inputs_children(element)
        fix_hydro_common_ds_refs(element)

    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    return xml_tree


def convert_gut(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """_summary_

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        # insert_inputs_outputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_realization(element)
        move_tin_attribs_to_realization(element)
        format_product_version(element)
        format_analysis(element)
        replace_spaces_with_underscores(element)
        # fix_input_children(element)
        reformat_csv(element)
        format_inputs_children(element)
    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    format_gut(xml_tree)
    fix_gut_ids(xml_tree)
    return xml_tree


def convert_fhm(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """_summary_

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        # insert_inputs_outputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_realization(element)
        move_tin_attribs_to_realization(element)
        format_product_version(element)
        format_analysis(element)
        replace_spaces_with_underscores(element)
    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    format_fhm(xml_tree)
    return xml_tree


def convert_stream(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """_summary_

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        # insert_inputs_outputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_realization(element)
        move_tin_attribs_to_realization(element)
        format_product_version(element)
        format_analysis(element)
        replace_spaces_with_underscores(element)
    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    # format_fhm(xml_tree)
    return xml_tree


def convert_rca(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """convert rca

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)
        # format_vectors(element)
        switch_to_realization(element)
        # Must go after switch_to_realization
        # insert_inputs(element)
        format_inputs_vectors(element)
        rename_outer_inputs(element)
        format_analysis(element)
        replace_spaces_with_underscores(element)
        format_inputs_children(element)
    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    fix_rz(xml_tree)
    return xml_tree


# TODO: cvc-minLength-valid: Value 'DA' with length = '2' is not facet-valid with respect to minLength '3' for type 'ProjectIdType'.
def convert_RSContext(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)
        switch_to_realization(element)
        format_layers_vectors(element)
        insert_inputs(element)  # Must go after switch_to_realization()
        replace_spaces_with_underscores(element)
    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    format_ids(xml_tree)
    fix_log_file(xml_tree)
    fix_duplicates_pbs(xml_tree)
    return xml_tree


def convert_general(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """Converts multiple project types in Anabranch

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    try:
        xml_tree = ET.parse(old_xml_file)

        for element in xml_tree.iter():
            format_project(element)
            format_warehouse(element)

            format_layers_vectors(element)
            switch_to_realization(element)
            rename_outer_inputs(element)
            format_analysis(element)
            format_product_version(element)
            replace_spaces_with_underscores(element)
            format_inputs_children(element)
            format_realization_logfiles(element)

        standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
        format_ids(xml_tree)
        fix_duplicates_brat_doc(xml_tree)
        return xml_tree

    except Exception as ex:
        log = Logger("Convert XML (General)")
        log.error(ex)


def convert_nd(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """_summary_

    Args:
        old_xml_file (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_

    Returns:
        _type_: _description_
    """
    # try:
    xml_tree = ET.parse(old_xml_file)

    # for element in xml_tree.iter():
    # format_project(element)
    # format_warehouse(element)

    # format_layers_vectors(element)
    # switch_to_realization(element)
    # rename_outer_inputs(element)
    # format_analysis(element)
    # # format_product_version(element)
    # replace_spaces_with_underscores(element)
    # format_inputs_children(element)
    # format_realization_logfiles(element)

    # standard_globals(xml_tree,watersheds_db_path,new_xml_path, champ_db_path, old_xml_path)
    # format_ids(xml_tree)
    # fix_duplicates_brat_doc(xml_tree)
    return xml_tree


def convert_cm(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        format_layers_vectors(element)
        switch_to_realization(element)
        rename_outer_inputs(element)
        format_analysis(element)
        format_product_version(element)
        replace_spaces_with_underscores(element)
        format_inputs_children(element)
        format_realization_logfiles(element)

    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    format_ids(xml_tree)
    fix_duplicates_brat_doc(xml_tree)
    fix_champmetrics(xml_tree)
    return xml_tree


def convert_inundation(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        format_layers_vectors(element)
        switch_to_realization(element)
        rename_outer_inputs(element)
        format_analysis(element)
        format_product_version(element)
        replace_spaces_with_underscores(element)
        format_inputs_children(element)
    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    format_ids(xml_tree)
    fix_dce(xml_tree)
    return xml_tree


def convert_gcd(old_xml_file, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    xml_tree = ET.parse(old_xml_file)

    for element in xml_tree.iter():
        format_project(element)
        format_warehouse(element)

        format_layers_vectors(element)
        switch_to_realization(element)
        rename_outer_inputs(element)
        format_analysis(element)
        format_product_version(element)
        replace_spaces_with_underscores(element)
        format_inputs_children(element)
    standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path)
    format_ids(xml_tree)
    fix_projectpath(xml_tree)
    return xml_tree


def standard_globals(xml_tree, watersheds_db_path, new_xml_path, champ_db_path, old_xml_path):
    """ Methods used for all file types that require searching the entire file for a certain element

    Args:
        xml_tree (_type_): _description_
        watersheds_db_path (_type_): _description_
        new_xml_path (_type_): _description_
        champ_db_path (_type_): _description_
        old_xml_path (_type_): _description_
    """
    add_champ_data(xml_tree, champ_db_path, new_xml_path)
    add_project_bounds(xml_tree, watersheds_db_path, new_xml_path, old_xml_path)
    remove_guids(xml_tree)
    change_bslashes_to_fslashes(xml_tree)
    format_paths(xml_tree)
    fix_champ_vbet(xml_tree)
    fix_duplicate_ids(xml_tree)


def insert_inputs_outputs(element):
    fix_tin_children(element)

    if element.tag == "Realization":
        in_outputs = []
        in_inputs = []
        for sub_elem in list(element):
            if sub_elem.tag == "TIN":
                for elem in list(sub_elem):
                    if elem.tag not in ["Path", "Name", "MetaData"]:
                        in_outputs.append(elem)
                        sub_elem.remove(elem)
                in_inputs.append(sub_elem)
                element.remove(sub_elem)
            elif sub_elem.tag == "Vector":
                in_inputs.append(sub_elem)
                element.remove(sub_elem)
            elif sub_elem.tag == "SurveyExtents":
                in_inputs.append(sub_elem[0])
                if "active" in in_inputs[-1].attrib:
                    in_inputs[-1].attrib.pop("active")
                    new_meta = ET.Element("MetaData")
                    new_active = ET.Element("Meta")
                    new_active.attrib["name"] = "active"
                    new_active.attrib["type"] = "boolean"
                    new_active.text = "true"
                    new_meta.append(new_active)
                    in_inputs[-1].append(new_meta)

                element.remove(sub_elem)

        inputs_elem = ET.Element("Inputs")
        inputs_elem.extend(in_inputs)
        outputs_elem = ET.Element("Outputs")
        outputs_elem.extend(in_outputs)
        element.append(inputs_elem)

        element.append(outputs_elem)


def format_realization_logfiles(element):
    if element.tag == "Realization":
        has_logfile = False
        log_container = ET.Element("Logs")
        for sub_elem in list(element):
            if sub_elem.tag == "LogFile" and not has_logfile:
                has_logfile = True
                log_container.append(sub_elem)
                element.remove(sub_elem)
            elif sub_elem.tag == "LogFile" and has_logfile:
                log_container.append(sub_elem)
                element.remove(sub_elem)

        if has_logfile:
            element.insert(1, log_container)


def fix_tin_children(element):
    log = Logger("Insert Inputs In Realization")
    if element.tag == "Outputs":
        for sub_elem in list(element):
            if sub_elem.tag not in ["Name", "Path", "MetaData"]:
                if sub_elem.tag == "DEMHillshade":
                    sub_elem.tag = "HillShade"

                elif sub_elem.tag == "WaterSurfaceTIN":
                    sub_elem.tag = "TIN"
                    if "active" in sub_elem.attrib:
                        new_meta = ET.Element("MetaData")
                        new_active = ET.Element("Meta")
                        new_active.attrib["name"] = "active"
                        new_active.attrib["type"] = "boolean"
                        new_active.text = "true"
                        new_meta.append(new_active)
                        sub_elem.append(new_meta)
                        sub_elem.attrib.pop("active")
                elif sub_elem.tag == "Stages":
                    vectors = list(sub_elem)
                    for vec in vectors:
                        if "stage" in vec.attrib:
                            vec.attrib.pop("stage")
                        if "type" in vec.attrib:
                            vec.attrib.pop("type")
                    element.extend(vectors)
                    element.remove(sub_elem)
                elif ".shp" in sub_elem[1].text:
                    sub_elem.tag = "Vector"
                elif ".tif" in sub_elem[1].text:
                    sub_elem.tag = "Raster"

                elif sub_elem.tag == "AssocSurfaces":
                    rasters = list(sub_elem)
                    for elem in rasters:
                        elem.tag = "Raster"
                    element.extend(rasters)
                    element.remove(sub_elem)


def fix_input_children(element):
    log = Logger("Insert Inputs In Realization")
    if element.tag == "Inputs":
        vals = element.findall("Raster")
        for sub_elem in list(element):
            if sub_elem.tag == "ExistingVegetation" or sub_elem.tag == "HistoricVegetation":
                rasters = list(sub_elem)

                element.extend(rasters)
                element.remove(sub_elem)

# Changes all \ to / for linux compatibility


def change_bslashes_to_fslashes(tree):
    """_summary_

    Args:
        tree (_type_): _description_
    """
    for element in tree.iter():
        for sub_element in element:
            # print(sub_element.tag, type(sub_element.text))
            if sub_element.text is not None and type(sub_element.text) == str and "\\" in sub_element.text:
                reformatted_path = sub_element.text.replace("\\", "/")
                sub_element.text = reformatted_path


def format_paths(tree):
    """_summary_

    Args:
        tree (_type_): _description_
    """
    for element in tree.iter():
        if element.tag == "Path":
            if element.text is not None and element.text[0] == "/":
                element.text = element.text[1: len(element.text)]
            if element.text is not None and element.text[-1] == "/":
                element.text = element.text[0: len(element.text) - 1]
            element.text = element.text.strip()


def replace_spaces_with_underscores(element):
    if element.tag == "Path":
        element.text = element.text.replace(" ", "_")

# Adds input to to realization and puts all realization content inside


def insert_inputs(element):
    log = Logger("Insert Inputs In Realization")

    if element.tag == "Realization":
        if len(element.attrib["productVersion"]) == 3:
            element.attrib["productVersion"] += ".0"
        elif len(element.attrib["productVersion"]) < 5:
            log.error("productVersion format incorrect.")

        inputs_element = ET.Element("Datasets")
        logs_elem = ET.Element("Logs")
        element.append(inputs_element)
        sub_elems = list(element)
        inputs_sub_elems = sub_elems[1:len(sub_elems) - 1]
        sub_elems = [sub_elems[0], sub_elems[len(sub_elems) - 1]]
        for elem in inputs_sub_elems:
            if elem.tag == "LogFile":
                logs_elem.append(elem)
                element.insert(1, logs_elem)

            else:
                sub_elems[1].append(elem)

        # sub_elems.insert(1, logs_elem)
        elems = list(element)
        for i in range(1, len(elems) - 1):
            if elems[i].tag != "Logs":
                element.remove(elems[i])


def format_product_version(element):
    log = Logger("Format Product Version")
    if element.tag == "Realization":
        if len(element.attrib["productVersion"]) == 3:
            element.attrib["productVersion"] += ".0"
        elif len(element.attrib["productVersion"]) == 0:
            element.attrib["productVersion"] = "0.0.0"
        elif len(element.attrib["productVersion"]) == 1:
            element.attrib["productVersion"] += ".0.0"
        elif element.attrib["productVersion"].count(".") == 3:
            element.attrib["productVersion"] = element.attrib["productVersion"][0:element.attrib["productVersion"].rfind(".")]
        elif len(element.attrib["productVersion"]) < 5:
            log.error("productVersion format incorrect.")


def add_champ_data(tree, champ_db_path, new_xml_path):
    log = Logger("Add CHaMP Data")
    visit_num = None
    year = ""
    site = ""
    watershed = ""
    needs_champ_data = False

    visit_meta_names = {"Visit", "VisitID", "Visit_ID"}
    for element in tree.iter():
        if element.tag == "Meta":
            if element.attrib["name"] in visit_meta_names:
                visit_num = int(element.text)
                needs_champ_data = True
            if element.attrib["name"] == "Year":
                year = element.text
            if element.attrib["name"] == "Site":
                site = element.text
            if element.attrib["name"] == "Watershed":
                watershed = element.text

    if needs_champ_data:
        conn = sqlite3.connect(champ_db_path)
        conn.row_factory = dict_factory
        curs = conn.cursor()
        curs.execute("SELECT * FROM visits WHERE visit = ?", [visit_num])
        champ_info = curs.fetchone()
        if champ_info is None:
            log.warning(f"Could not create dictionary from visit: {visit_num}")
        else:
            if champ_info['watershed'] == watershed and champ_info['site'] == site and str(champ_info['year']) == year:
                insert_bounds_make_geojson(tree, champ_info, new_xml_path)

            else:
                log.warning(f"Watershed, site, and/or year in xml do not match visit {visit_num} in CHaMP database.")
                insert_bounds_make_geojson(tree, champ_info, new_xml_path)

# Adds project bounds from riverscapes/watersheds db


def add_project_bounds(tree, watersheds_db_path, new_xml_path, old_xml_path):
    log = Logger("Add Project Bounds")
    huc_id = ""
    huc_meta_names = {"HUCID", "HUC", "HUC8"}
    needs_pb = True
    for element in tree.iter():
        if element.tag == "ProjectBounds":
            needs_pb = False
            try:
                new_geojson = path.join(path.dirname(new_xml_path), "project_bounds.geojson")
                old_geojson = path.join(path.dirname(old_xml_path), "project_bounds.geojson")
                shutil.copy(old_geojson, new_geojson)
            except Exception as ex:
                log.warning(ex)
            break
    if needs_pb:
        for element in tree.iter():
            if element.tag == "Meta":
                if element.attrib["name"] in huc_meta_names:
                    huc_id = element.text

                    if huc_id == "":
                        log.warning("No HUCID in Meta")
                    elif len(huc_id) > 8:
                        log.warning("HUCID is greater than 8 characters. Cannot match with database.")
                    else:
                        conn = sqlite3.connect(watersheds_db_path)
                        conn.row_factory = dict_factory
                        curs = conn.cursor()
                        curs.execute("select * from watersheds where huc8 = " + huc_id)
                        bp_info = curs.fetchone()
                        if bp_info is None:
                            log.warning("Could not create dictionary from HUC_id: " + huc_id)
                        else:
                            states = {"AL": "Alabama", "AK": "Alaska", "AZ": "Arizona", "AR": "Arkansas", "CA": "California", "CO": "Colorado", "CT": "Connecticut", "DE": "Delaware", "FL": "Florida", "GA": "Georgia", "HI": "Hawaii", "ID": "Idaho", "IL": "Illinois", "IN": "Indiana", "IA": "Iowa", "KS": "Kansas", "KY": "Kentucky", "LA": "Louisiana", "ME": "Maine", "MD": "Maryland", "MA": "Massachusetts", "MI": "Michigan", "MN": "Minnesota", "MS": "Mississippi", "MO": "Missouri", "MT": "Montana", "NE": "Nebraska", "NV": "Nevada", "NH": "New Hampshire", "NJ": "New Jersey", "NM": "New Mexico", "NY": "New York", "NC": "North Carolina", "ND": "North Dakota", "OH": "Ohio", "OK": "Oklahoma", "OR": "Oregon", "PA": "Pennsylvania", "RI": "Rhode Island", "SC": "South Carolina", "SD": "South Dakota", "TN": "Tennessee", "TX": "Texas", "UT": "Utah", "VT": "Vermont", "VA": "Virginia", "WA": "Washington", "WV": "West Virginia", "WI": "Wisconsin", "WY": "Wyoming", "DC": "Washington D.C.", "CN": "Canada"}
                            name_elem = ET.Element("Meta")
                            name_elem.attrib["name"] = "Name"
                            name_elem.text = bp_info["name"]
                            state_elem = ET.Element("Meta")
                            state_elem.attrib["name"] = "States"
                            states_list = bp_info["states"].split(",")
                            state_str = ""
                            for i in range(len(states_list)):
                                state_str += states[states_list[i]]
                                if not i == len(states_list) - 1:
                                    state_str += ","
                            state_elem.text = state_str
                            for element in tree.iter():
                                if element.tag == "MetaData":
                                    element.append(name_elem)
                                    element.append(state_elem)
                                    break
                            insert_bounds_make_geojson(tree, bp_info, new_xml_path)
                    break


def insert_bounds_make_geojson(tree, db_info, new_xml_path):

    data_dict = json.loads(db_info["bounds"])
    pb_elem = ET.Element("ProjectBounds")

    centroid_elem = ET.Element("Centroid")
    centroid_elem.append(ET.Element("Lat"))
    centroid_elem[0].text = str(data_dict["centroid"]["lat"])
    centroid_elem.append(ET.Element("Lng"))
    centroid_elem[1].text = str(data_dict["centroid"]["lng"])
    pb_elem.append(centroid_elem)

    bb_elem = ET.Element("BoundingBox")
    bb_elem.append(ET.Element("MinLat"))
    bb_elem[0].text = str(data_dict["boundingBox"]["MinLat"])
    bb_elem.append(ET.Element("MinLng"))
    bb_elem[1].text = str(data_dict["boundingBox"]["MinLng"])
    bb_elem.append(ET.Element("MaxLat"))
    bb_elem[2].text = str(data_dict["boundingBox"]["MaxLat"])
    bb_elem.append(ET.Element("MaxLng"))
    bb_elem[3].text = str(data_dict["boundingBox"]["MaxLng"])
    pb_elem.append(bb_elem)

    path_elem = ET.Element("Path")
    path_elem.text = "project_bounds.geojson"
    pb_elem.append(path_elem)

    pb_index = 5
    for element in tree.iter():
        if element.tag == "Project":
            for i in range(len(list(element))):
                if list(element)[i].tag == "Realizations":
                    pb_index = i

    for element in tree.iter():
        if element.tag == "Project":
            element.insert(pb_index, pb_elem)

    poly_str = json.dumps(json.loads(db_info["polygon"]))
    geojson_path = path.dirname(new_xml_path)
    geojson_file = open(path.join(geojson_path, "project_bounds.geojson"), "w")
    geojson_file.write(poly_str)
    geojson_file.close()

# Adds new namespace details


def format_project(element):
    if element.tag == "Project":
        NS_XSI = "{http://www.w3.org/2001/XMLSchema-instance}"
        element.attrib[NS_XSI + "noNamespaceSchemaLocation"] = "https://xml.riverscapes.net/Projects/XSD/V2/RiverscapesProject.xsd"


def format_warehouse(elem):
    legacy_meta = []
    if elem.tag == "Project":
        for element in list(elem):
            if element.tag == "Warehouse":
                meta_elems = element.findall("Meta")
                id_attrib = ""
                for sub_elem in meta_elems:
                    legacy_meta.append(sub_elem)
                    if sub_elem.attrib["name"] == "id":
                        id_attrib = sub_elem.text
                        element.attrib["id"] = id_attrib
                    element.remove(sub_elem)
                element.attrib["apiUrl"] = "https://12312312.amazon.ca/api/prod"
                element.text = ""

            if element.tag == "MetaData":
                for meta in legacy_meta:
                    meta.attrib["name"] = "legacy_wh_" + meta.attrib["name"]
                element.extend(legacy_meta)


def format_vectors(element):
    if element.tag == "Vector":
        path_elems = element.findall("Path")
        if len(path_elems) > 0:
            element.attrib["lyrName"] = path_elems[0].text
            element.remove(path_elems[0])
            element.attrib.pop("id")


def format_vectors_rvd(tree):
    for elem in tree.iter():
        if elem.tag == "Layers":
            for element in list(elem):
                if element.tag == "Vector":
                    path_elems = element.findall("Path")
                    if len(path_elems) > 0:
                        element.attrib["lyrName"] = path_elems[0].text
                        element.remove(path_elems[0])
                        element.attrib.pop("id")
# Reformats Vector elements that are children of Layers element. (RSContext)


def format_layers_vectors(element):
    if element.tag == "Layers":
        # vector_elems = element.findall("Vector")
        for elem in element.iter():
            format_vectors(elem)


def format_inputs_vectors(element):
    if element.tag == "Stages":
        # vector_elems = element.findall("Vector")
        for elem in element.iter():
            format_vectors(elem)

# Changes child elements of Realizations to Realization


def switch_to_realization(element):
    if element.tag == "Realizations":
        sub_elems = list(element)
        for realization in sub_elems:
            realization.tag = "Realization"


def format_realization(element):
    if element.tag == "Realization":
        dict_keys = element.attrib.keys()
        keys_to_remove = []
        for key in dict_keys:
            if key == "projected" or key == "promoted":

                has_metadata = False
                for sub_elem in list(element):
                    if sub_elem.tag == "MetaData":
                        has_metadata = True
                        new_meta = ET.Element("Meta")
                        new_meta.attrib["name"] = key
                        new_meta.text = element.attrib[key]
                        sub_elem.append(new_meta)
                        keys_to_remove.append(key)
                        break

                if not has_metadata:
                    meta_data_elem = ET.Element("MetaData")
                    new_meta = ET.Element("Meta")
                    new_meta.attrib["name"] = key
                    new_meta.text = element.attrib[key]
                    meta_data_elem.append(new_meta)
                    element.insert(1, meta_data_elem)
                    keys_to_remove.append(key)

        for k in keys_to_remove:
            element.attrib.pop(k)


def move_tin_attribs_to_realization(element):
    if element.tag == "Realization":
        active_val = None
        for sub_elem in list(element):
            if sub_elem.tag == "Inputs":
                for elem in list(sub_elem):
                    if elem.tag == "TIN":
                        if "active" in elem.attrib:
                            active_val = elem.attrib["active"]
                            elem.attrib.pop("active")
                            break

        if active_val is not None:
            for sub_elem in list(element):
                if sub_elem.tag == "MetaData":
                    new_meta = ET.Element("Meta")
                    new_meta.attrib["name"] = "active"
                    new_meta.attrib["type"] = "boolean"
                    new_meta.text = active_val
                    sub_elem.append(new_meta)

# Removes all guid attributes in file


def remove_guids(tree):
    for element in tree.iter():
        # format_warehouse(element)
        # format_project(element)
        for sub_element in element:
            if "guid" in sub_element.attrib:
                sub_element.attrib.pop("guid")


def rename_outer_inputs(element):
    if element.tag == "Project":
        sub_elems = list(element)
        for sub_elem in sub_elems:
            if sub_elem.tag == "Inputs":
                sub_elem.tag = "CommonDatasets"


def format_analysis(element):
    # Give analysis an id
    if element.tag == "Analyses":
        sub_elems = list(element)
        analysis_count = 0
        for sub_elem in sub_elems:
            if sub_elem.tag == "Analysis":
                sub_elem.attrib["id"] = "analysis_" + str(analysis_count)
                analysis_count += 1
    # Change outputs to products
    elif element.tag == "Analysis":
        sub_elems = list(element)
        for sub_elem in sub_elems:
            if sub_elem.tag == "Outputs":
                sub_elem.tag = "Products"
    # Give products vectors an id
    elif element.tag == "Products" or element.tag == "Inputs":
        sub_elems = list(element)
        vector_count = 0
        raster_count = 0
        for sub_elem in sub_elems:
            if sub_elem.tag == "Vector" and "id" not in sub_elem.attrib:
                sub_elem.attrib["id"] = "vector_" + str(vector_count)
                vector_count += 1
            elif (sub_elem.tag == "Raster" or sub_elem.tag == "DataTable"):
                if "ref" in sub_elem.attrib:
                    if sub_elem.attrib["ref"] == "SOL_RAS":
                        element.remove(sub_elem)
                    else:
                        sub_elem.tag = "CommonDatasetRef"
                    # sub_elem.attrib["id"] = sub_elem.attrib["ref"]
                    # sub_elem.attrib.pop("ref")
                elif "id" not in sub_elem.attrib:
                    sub_elem.attrib["id"] = "raster_" + str(raster_count)
                raster_count += 1


def reformat_csv(element):
    if element.tag == "CSV" or element.tag == "MSAccessDB":
        if "ref" in element.attrib:
            element.attrib["id"] = element.attrib["ref"]
            element.attrib.pop("ref")
        element.attrib["id"] = element.attrib["id"].replace(" ", "")


def fix_hydro_common_ds_refs(element):
    if element.tag == "Inputs":
        for sub_elem in list(element):
            has_path = False
            for elem in list(sub_elem):
                if elem.tag == "Path":
                    has_path = True
                    break

            if not has_path:
                sub_elem.tag = "CommonDatasetRef"


def format_inputs_children(element):
    if element.tag == "Inputs":
        old_input_children = ["ExistingVegetation", "HistoricVegetation", "DrainageNetworks", "FragmentedValleyBottom", "LargeRiverPolygon"]
        new_input_children = []
        unnamed_vectors = ["FragmentedValleyBottom", "SegmentedNetwork", "ValleyBottom", "LargeRiverPolygon"]
        for sub_elem in list(element):
            if sub_elem.tag in old_input_children and len(list(sub_elem)) > 0 and len(list(list(sub_elem)[0])) > 0:
                if "ref" in sub_elem.attrib:
                    sub_elem.tag = "CommonDatasetRef"
                    new_input_children.extend(list(list(sub_elem)[0]))
                    for child in list(sub_elem):
                        sub_elem.remove(child)
                    new_input_children.append(sub_elem)
                    element.remove(sub_elem)
                else:

                    new_input_children.extend(list(list(sub_elem)[0]))
                    for child in list(sub_elem[0]):
                        sub_elem[0].remove(child)
                    sub_elem[0].tag = "CommonDatasetRef"
                    new_input_children.append(sub_elem[0])
                    element.remove(sub_elem)

            elif sub_elem.tag in unnamed_vectors:
                sub_elem.tag = "CommonDatasetRef"
                # sub_elem.attrib["id"] = sub_elem.attrib["ref"]
                # sub_elem.attrib.pop("ref")
                new_input_children.append(sub_elem)
                element.remove(sub_elem)
            elif sub_elem.tag == "ExistingCover" or sub_elem.tag == "HistoricCover":
                sub_elem.tag = "CommonDatasetRef"
                # sub_elem.attrib["id"] = sub_elem.attrib["ref"]
                # sub_elem.attrib.pop("ref")
                new_input_children.append(sub_elem)
                element.remove(sub_elem)
            elif sub_elem.tag == "Topography" or sub_elem.tag == "DrainageNetworks":
                new_input_children.extend(list(sub_elem))
                element.remove(sub_elem)
        vector_count = 0
        raster_count = 0
        for child in new_input_children:
            if len(list(child)) > 0 and ".shp" in list(child)[1].text and "id" not in child.attrib:
                child.tag = "Vector"
                child.attrib["id"] = "vector_" + str(vector_count)
                vector_count += 1
            elif child.tag == "Raster" and "id" not in child.attrib:
                child.attrib["id"] = "raster_" + str(raster_count)
                raster_count += 1
            elif child.tag == "Slope" or child.tag == "Flow":
                child.tag = "Raster"
                child.attrib["id"] = "raster_" + str(raster_count)
                raster_count += 1
            elif child.tag == "DEM" or child.tag == "Network":
                child.tag = "CommonDatasetRef"
                # child.attrib["id"] = child.attrib["ref"]
                # child.attrib.pop("ref")

        element.extend(new_input_children)


def format_common_data_inputs(element):
    old_input_children = ["Breaklines", "Topo_Points", "Survey_Extent", "Control_Points", "EdgeofWater_Points", "TopoTin"]
    for sub_elem in list(element):
        if sub_elem.tag in old_input_children:
            sub_elem.tag = "CommonDatasetRef"


def format_gut_csv(element):
    if element.tag == "CSV":
        for sub_elem in list(element):
            if sub_elem.tag == "Project":
                meta_elem = ET.Element("MetaData")
                project_meta = ET.Element("Meta")
                project_meta.attrib["name"] = "Project"
                project_meta.text = sub_elem.text
                meta_elem.append(project_meta)
                element.remove(sub_elem)
                element.append(meta_elem)


def fix_champ_vbet(tree):
    warehouse_id = ""
    for element in tree.iter():
        if element.tag == "Warehouse":
            warehouse_id = element.attrib["id"]
            break
    CHAMP_VBET_IDS = [
        "e6725e02-5b93-4452-ac95-b5d62528e349", "abb9ad09-f574-409a-aed5-7b80124acfc1", "cf9989f2-8a91-419c-a70f-ebe025157e46",
        "ce4dcf08-83ba-4389-a2ab-9d7c1ecc9ca8", "edd79ad5-bb39-4619-ba76-2e1c6b459236",
        "d8e652bb-a3cf-497f-97a5-61a993c83da9", "35d162d8-6a92-4bca-88fb-dc9286036dd1", "dd7bf3ef-fcf6-4d18-8341-bd006dd50c8f",
        "b0ab94a9-d99e-4a12-bbd3-8aea062ce6c0", "e34f6bac-f198-4f35-b68b-838928b36b48",
        "7f79f0c8-7f86-4638-a49e-36ac408ee285", "b7cf605f-805a-4688-9f99-0d19408d7149", "29b1b0b7-dd53-4fc1-8236-6768dc4585ac",
        "80449485-7619-4a65-82a3-037358174102", "513a4282-9cf7-4d5c-83ae-47781a3ae4e9",
    ]
    if warehouse_id in CHAMP_VBET_IDS:
        for element in tree.iter():
            if element.tag == "ProjectType":
                element.text = "VBETCHaMP"


def format_gut(tree):
    for element in tree.iter():
        if element.tag == "Inputs":
            for sub_elem in list(element):
                if ".tif" in sub_elem[1].text:
                    sub_elem.tag = "Raster"
                elif ".shp" in sub_elem[1].text:
                    sub_elem.tag = "Vector"
                if len(sub_elem.attrib["id"]) < 3:
                    sub_elem.attrib["id"] = "layer_" + sub_elem.attrib["id"]
        elif element.tag == "EvidenceLayers":
            element.tag = "Intermediates"
            for sub_elem in list(element):
                if sub_elem.tag == "Slope":
                    sub_elem.tag = "Raster"
                if len(sub_elem.attrib["id"]) < 3:
                    sub_elem.attrib["id"] = "layer_" + sub_elem.attrib["id"]

        elif element.tag == "Analysis":
            gut_config = ET.Element("ConfigFile")
            config = ET.Element("Configuration")
            gut_config.append(element[1][0])
            gut_config.append(element[1][1])
            gut_config.attrib["id"] = element[1].attrib["id"]
            if len(gut_config.attrib["id"]) < 3:
                gut_config.attrib["id"] = "layer_" + gut_config.attrib["id"]
            config.append(gut_config)
            element[1] = config
        elif element.tag == "Products":
            for sub_elem in list(element):
                sub_elem.tag = "Vector"


def format_fhm(tree):
    for element in tree.iter():
        if element.tag == "Inputs":
            for sub_elem in list(element):
                if ".tif" in sub_elem[1].text:
                    sub_elem.tag = "Raster"
                elif ".shp" in sub_elem[1].text:
                    sub_elem.tag = "Vector"

    for element in tree.iter():
        if element.tag == "Analysis":
            element.extend(list(element[1][0]))
            element.extend(list(element[1][1]))
            element.remove(element[1])
    fis_file = ""
    for element in tree.iter():
        if element.tag == "Analysis":
            for sub_elem in list(element):
                if sub_elem.tag == "FISFile":
                    fis_file = sub_elem.text
                    element.remove(sub_elem)

    for element in tree.iter():
        if element.tag == "Analysis":
            for sub_elem in list(element):
                if sub_elem.tag == "Outputs":
                    element.append(sub_elem[0])
                    element.remove(sub_elem)

    for element in tree.iter():
        if element.tag == "Analysis":
            del element[1]
            del element[3]
            prod_elem = ET.Element("Products")
            prod_elem.extend(element[3: len(list(element))])

            for elem in element[3:len(list(element))]:
                element.remove(elem)
            element.append(prod_elem)

    # print("fefe")


def format_ids(tree):
    for element in tree.iter():
        if "id" in element.attrib:
            if len(element.attrib["id"]) < 3:
                element.attrib["id"] = "layer_" + element.attrib["id"]


def format_ids_topo(tree):
    for element in tree.iter():
        if "id" in element.attrib:
            if element.tag == "Realization" and element.attrib["id"] == "":
                element.attrib["id"] = "survey_data_projected"
            elif element.attrib["id"] == "survey_data_un          ":
                element.attrib["id"] = "survey_data_unprojected"


def fix_topo_tins(tree):
    for element in tree.iter():
        if element.tag == "TIN" and "active" in element.attrib:
            new_meta = ET.Element("MetaData")
            new_active = ET.Element("Meta")
            new_active.attrib["name"] = "active"
            new_active.attrib["type"] = "boolean"
            new_active.text = element.attrib["active"]
            new_meta.append(new_active)
            element.append(new_meta)
            element.attrib.pop("active")


def fix_breaklinedxf(tree):
    has_breaklinedxf = False
    for element in tree.iter():
        if element.tag == "CommonDatasets":
            for sub_elem in list(element):
                if sub_elem.tag == "Vector" and sub_elem.attrib["id"] == "BreaklineDXF" and has_breaklinedxf:
                    element.remove(sub_elem)
                elif sub_elem.tag == "Vector" and sub_elem.attrib["id"] == "BreaklineDXF":
                    has_breaklinedxf = True


def fix_rz(tree):
    rz2_count = 0
    rz3_count = 0
    for element in tree.iter():
        if element.tag == "Realizations":
            for sub_elem in list(element):
                if sub_elem.tag == "Realization" and sub_elem.attrib["id"] == "RZ2":
                    rz2_count += 1
                elif sub_elem.tag == "Realization" and sub_elem.attrib["id"] == "RZ3":
                    rz3_count += 1

                if sub_elem.attrib["id"] == "RZ2" and rz2_count > 1:
                    sub_elem.attrib["id"] += "_" + str(rz2_count)
                if sub_elem.attrib["id"] == "RZ3" and rz3_count > 1:
                    sub_elem.attrib["id"] += "_" + str(rz3_count)


def fix_log_file(tree):
    logf_count = 0
    for element in tree.iter():
        if element.tag == "Inputs":
            for sub_elem in list(element):
                if sub_elem.tag == "LogFile":
                    sub_elem.tag = "File"
                    logf_count += 1

    if logf_count > 1:
        print("efefef")


def fix_duplicates_pbs(tree):
    has_pb = False
    for element in tree.iter():
        if element.tag == "Project":
            for sub_elem in list(element):
                if sub_elem.tag == "ProjectBounds" and has_pb:
                    element.remove(sub_elem)
                elif sub_elem.tag == "ProjectBounds":
                    has_pb = True


def fix_duplicates_brat_doc(tree):
    has_brr = False
    for element in tree.iter():
        if element.tag == "Outputs":
            for sub_elem in list(element):
                if has_brr and sub_elem.attrib["id"] == "BRAT_RUN_REPORT":
                    element.remove(sub_elem)
                elif sub_elem.attrib["id"] == "BRAT_RUN_REPORT":
                    has_brr = True


def fix_dce(tree):
    dce1 = ""
    dce2 = ""
    for element in tree.iter():
        if element.tag == "Realization":
            for sub_elem in list(element):
                if sub_elem.tag == "Inputs" and sub_elem[0].tag == "DCE1":
                    dce1 = sub_elem[0].text
                    dce2 = sub_elem[1].text
                    element.remove(sub_elem)
                    break

    for element in tree.iter():
        if element.tag == "Project":
            for sub_elem in list(element):
                if sub_elem.tag == "MetaData":
                    meta_1 = ET.Element("Meta")
                    meta_1.attrib["name"] = "DCE1"
                    meta_1.text = dce1
                    sub_elem.append(meta_1)
                    meta_2 = ET.Element("Meta")
                    meta_2.attrib["name"] = "DCE2"
                    meta_2.text = dce2
                    sub_elem.append(meta_2)


def fix_projectpath(tree):
    for element in tree.iter():
        if element.tag == "Realization":
            for sub_elem in list(element):
                if sub_elem.tag == "ProjectPath":
                    proj_elem = sub_elem
                    name_elem = element[0]
                    element.remove(sub_elem)
                    # element.remove(name_elem)
                    # element.append(ET.Element("Datasets"))
                    ds_elem = ET.Element("Datasets")
                    f_elem = ET.Element("ConfigFile")
                    proj_elem.tag = "Path"
                    f_elem.attrib["id"] = proj_elem.text[0:proj_elem.text.find(".")]
                    f_elem.append(name_elem)
                    f_elem.append(proj_elem)
                    ds_elem.append(f_elem)

                    element.append(ds_elem)


def remove_common_datasets(tree):
    for element in tree.iter():
        if element.tag == "Project":
            for sub_elem in list(element):
                if sub_elem.tag == "CommonDatasets":
                    element.remove(sub_elem)
        if element.tag == "Realization":
            for sub_elem in list(element):
                if sub_elem.tag == "Inputs":
                    element.remove(sub_elem)


def fix_champmetrics(tree):
    for element in tree.iter():
        if element.tag == "Products":
            csv_count = 0
            for sub_elem in list(element):
                if sub_elem.tag == "CSV":
                    sub_elem.attrib["id"] = "csv_" + str(csv_count)
                    csv_count += 1
                elif sub_elem.tag == "Database":
                    sub_elem.attrib["id"] = "database_0"


def fix_duplicate_ids(tree):
    ids = {}
    curr_realization = ""
    for element in tree.iter():
        if element.tag == "Realization":
            curr_realization = element.attrib["id"]

        if (element.tag == "Vector" or element.tag == "Raster") and "id" in element.attrib and element.attrib["id"] + curr_realization in ids:
            ids[element.attrib["id"] + curr_realization] += 1
            element.attrib["id"] += "_" + str(ids[element.attrib["id"] + curr_realization])
        elif (element.tag == "Vector" or element.tag == "Raster") and "id" in element.attrib:
            ids[element.attrib["id"] + curr_realization] = 1


def fix_gut_ids(tree):

    id_count = 0
    layer_id_count = 0
    for element in tree.iter():
        if "id" in element.attrib and element.attrib["id"].startswith("ID"):
            if "_" in element.attrib["id"]:
                element.attrib["id"] = element.attrib["id"][0:element.attrib["id"].find("_") + 1] + str(id_count)
            else:
                element.attrib["id"] += str(id_count)

            id_count += 1
        elif "id" in element.attrib and element.attrib["id"].startswith("layer_ID"):
            element.attrib["id"] += str(layer_id_count)
            layer_id_count += 1
        elif "id" in element.attrib and element.attrib["id"].startswith("Tier"):
            element.attrib["id"] += "_" + str(random.randint(0, 999999))
            layer_id_count += 1
# Used for testing with Anabranch data


# if __name__ == '__main__':
#     parser = argparse.ArgumentParser()
#     parser.add_argument('db_path', help='SQLite database path', type=str)
#     parser.add_argument('old_warehouse_xml', help='Old warehouse project XML top level folder', type=str)
#     parser.add_argument('new_warehouse_xml', help='New warehouse project XML top level folder', type=str)
#     parser.add_argument('new_warehouse_xsd', help='New warehouse XSD', type=str)
#     args = parser.parse_args()

#     folder_str = "Anabranch/VBET/0b9d9fa5-2b30-4097-af0d-97a11aff682e"
#     old_warehouse_xml = path.join(environ['DATA_XML'], args.old_warehouse_xml)
#     new_warehouse_xml = path.join(environ['DATA_XML'], args.new_warehouse_xml,)

#     old_project_xml = path.join(old_warehouse_xml, folder_str, "project.rs.xml")
#     convert_general(old_project_xml)
