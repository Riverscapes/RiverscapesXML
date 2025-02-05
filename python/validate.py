import json
import re
import glob
from io import BytesIO
from jsonschema.exceptions import ValidationError
from lxml import etree
import jsonschema


def get_xsd(xsd_path):
    """We need to replace the absolute XSD reference by hand so this is where that happens

    The reason we do this is so that we are always testing against the current version of the XSD
    """
    with open(xsd_path, encoding='utf-8') as xsd_file:
        xsd = xsd_file.read()

    # Admitedly this is a bit hack-y but it works for now so....
    xsd = xsd.replace('http://xml.riverscapes.net/', './')
    xsd_encoded = bytes(xsd, encoding='utf-8')
    errors = validate_xsd(xsd_encoded)
    if len(errors) > 0:
        raise Exception(f'XSD Failed to validate: {xsd_path} \n {errors}')
    return xsd_encoded


def collect_files(dir_glob):
    """Collect all the files that match the glob pattern"""
    xml_files = glob.glob(dir_glob)
    return xml_files


def get_xml(xml_path):
    """Get the XML file"""
    with open(xml_path, 'rb') as xsd_file:
        xml_out = xsd_file.read()
    return xml_out


def validate_xml(xml_str: str, xsd_str: str):
    """Validate the XML file"""
    parser = etree.XMLParser(ns_clean=True, recover=False, encoding='utf-8')
    xmlschema_doc = etree.fromstring(xsd_str, parser=parser)
    xmlschema = etree.XMLSchema(xmlschema_doc)

    xml_doc = etree.parse(BytesIO(xml_str), parser=parser)
    ret_val = xmlschema.validate(xml_doc)

    return ret_val, xmlschema.error_log


def validate_xsd(xsd_str: str):
    """Validate the XSD file"""
    parser = etree.XMLParser(ns_clean=True, recover=False, encoding='utf-8')
    etree.fromstring(xsd_str, parser=parser)
    errors = list(parser.error_log)
    return errors


def validate_web_vector_json(json_obj: dict, schema: dict) -> bool:
    """ Make sure the Web Vector JSON is valid

    Args:
        json_obj (dict): _description_
        schema (dict): _description_

    Returns:
        bool: _description_
    """
    ret_val = True
    errors = []
    try:
        jsonschema.validate(json_obj, schema)
    except ValidationError as e:
        errors.append(f"JSON Did not validate against schema: '{e.message}' in object: {e.instance}")
        return False, errors

    if len(json_obj['layerStyles']) < 1:
        ret_val = False
        errors.append('layerStyles array cannot be empty')
    else:
        for o in json_obj['layerStyles']:
            # Check that we have all the right keys
            if ret_val is True:
                # Check for non-vector types
                # Check for mapbox stock layers
                if 'mapbox://' in o['source']:
                    ret_val = False
                    errors.append(f'You cannot use mapbox layers: {json.dumps(o)}')
                elif o['type'] == 'raster':
                    ret_val = False
                    errors.append(
                        f'Found a raster in your VECTOR symbology. This is not allowed: {json.dumps(o)}')
            if ret_val is True:
                unique_sources = list(dict.fromkeys(
                    [k['source-layer'] for k in json_obj['layerStyles']]))
                if len(unique_sources) != 1:
                    ret_val = False
                    errors.append(f'You cannot consume from multiple sources: {unique_sources}')
    return ret_val, errors


def validate_qris_metric_json(json_obj: dict, schema: dict) -> bool:
    """ Make sure the QRiS metric JSON is valid

    Args:
        json_obj (dict): _description_
        schema (dict): _description_

    Returns:
        bool: _description_
    """
    ret_val = True
    errors = []
    try:
        jsonschema.validate(json_obj, schema)
    except ValidationError as e:
        errors.append(f"JSON Did not validate against schema: '{e.message}' in object: {e.instance}")
        return False, errors

    # HERE IS WHERE SPECIFIC CHECKS CAN HAPPEN. THESE WOULD BE THINGS THE SCHEMA
    # CHECK CAN'T CATCH

    return ret_val, errors


def validate_qramp(qramp: str):
    """ Validate the QGIS color ramp file

    Args:
        qramp (str): _description_

    Returns:
        _type_: _description_
    """

    errors = []
    # Let's get the dealbreakers out of the way
    if len(qramp) < 0:
        errors.append('Ramp file was empty')
        return False, errors
    lines = qramp.split('\n')
    if len(lines) < 3:
        errors.append('Ramp file was missing the minimum number of lines (3)')
        return False, errors

    ret_val = True

    if lines[0].rstrip() != "# QGIS Generated Color Map Export File":
        errors.append('Missing the header line: "# QGIS Generated Color Map Export File". This is probabyl not a QGIS exported color ramp')
        ret_val = False
    if "INTERPOLATION:" not in lines[1]:
        errors.append('Missing the intepolation type on line 2: "INTERPOLATED:[DISCRETE|INTERPOLATED|EXACT]". This is probabyl not a QGIS exported color ramp')
        ret_val = False
    if lines[1].split(':')[1] not in ['DISCRETE', 'EXACT', 'INTERPOLATED']:
        errors.append(f"Interpolation value must be one of: 'DISCRETE', 'EXACT', 'INTERPOLATED'. Got: {lines[1]}")
        ret_val = False

    pat = "^(.+),([0-9]{1,3},){4}(.+)$"
    for cline in lines[2:]:
        # Blank lines are allowed at the end of the file
        # TODO: right now we're just ignoring blank lines anywhere
        if len(cline.strip()) == 0:
            continue
        if not re.match(pat, cline):
            errors.append(f'Value line did not match the pattern: "{pat}". Got: {cline}')
            ret_val = False

    return ret_val, errors


if __name__ == '__main__':

    xsd_file_test = get_xsd('Projects/XSD/V1/VBET.xsd')
    xml_file_test = get_xsd('Projects/examples/VBET.xml')
    result = validate_xml(xml_file_test, xsd_file_test)

    xmls = collect_files('./Projects/examples')
    results = {}
    for xml in xmls:
        basename = xml.split('.')[0]
        xml_file = get_xml(f'Projects/examples/{basename}.xml')
        try:
            xsd_file_res = get_xsd(f'Projects/XSD/V1/{basename}.xsd')
            results[basename] = validate_xml(xml_file, xsd_file_res)
        except Exception as out_err:
            # If there's no XSD for this project then just skip it for now
            pass

    print('hi there')
