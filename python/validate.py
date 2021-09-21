import glob
from io import BytesIO
from jsonschema.exceptions import ValidationError
from lxml import etree
import json
import re
import jsonschema


def get_xsd(xsd_path):
    """We need to replace the absolute XSD reference by hand so this is where that happens

    The reason we do this is so that we are always testing against the current version of the XSD
    """
    with open(xsd_path) as xsd_file:
        xsd = xsd_file.read()

    # Admitedly this is a bit hack-y but it works for now so....
    xsd = xsd.replace('http://xml.riverscapes.xyz/', './')
    xsd_encoded = bytes(xsd, encoding='utf-8')
    errors = validate_xsd(xsd_encoded)
    if len(errors) > 0:
        raise Exception(
            'XSD Failed to validate: {} \n {}'.format(xsd_path, errors))
    return xsd_encoded


def collect_files(dir_glob):
    xml_files = glob.glob(dir_glob)
    return xml_files


def get_xml(xml_path):
    with open(xml_path, 'rb') as xsd_file:
        xml = xsd_file.read()
    return xml


def validate_xml(xml_str: str, xsd_str: str):
    parser = etree.XMLParser(ns_clean=True, recover=False, encoding='utf-8')
    xmlschema_doc = etree.fromstring(xsd_str, parser=parser)
    xmlschema = etree.XMLSchema(xmlschema_doc)

    xml_doc = etree.parse(BytesIO(xml_str), parser=parser)
    result = xmlschema.validate(xml_doc)

    return result, xmlschema.error_log


def validate_xsd(xsd_str: str):
    parser = etree.XMLParser(ns_clean=True, recover=False, encoding='utf-8')
    etree.fromstring(xsd_str, parser=parser)
    errors = list(parser.error_log)
    return errors


def validate_web_vector_json(json_obj: dict, schema: dict) -> bool:
    result = True
    errors = []
    try:
        jsonschema.validate(json_obj, schema)
    except ValidationError as e:
        errors.append(
            "JSON Did not validate against schema: {}".format(e.message))
        return False, errors

    if len(json_obj['layerStyles']) < 1:
        result = False
        errors.append('layerStyles array cannot be empty')
    else:
        for o in json_obj['layerStyles']:
            # Check that we have all the right keys
            for k in ['id', 'type', 'source', 'source-layer', 'layout', 'paint']:
                if k not in o:
                    result = False
                    errors.append('Symbology is missing key: {}'.format(k))
                if result is True:
                    # Check for non-vector types
                    # Check for mapbox stock layers
                    if 'mapbox://' in o['source']:
                        result = False
                        errors.append(
                            'You cannot use mapbox layers: {}'.format(json.dumps(o)))
                    elif o['type'] == 'raster':
                        result = False
                        errors.append(
                            'Found a raster in your VECTOR symbology. This is not allowed: {}'.format(json.dumps(o)))
            if result is True:
                unique_sources = list(dict.fromkeys(
                    [k['source-layer'] for k in json_obj['layerStyles']]))
                if len(unique_sources) != 1:
                    result = False
                    errors.append(
                        'You cannot consume from multiple sources: {}'.format(unique_sources))
    return result, errors


def validate_qramp(qramp: str):

    errors = []
    # Let's get the dealbreakers out of the way
    if len(qramp) < 0:
        errors.append('Ramp file was empty')
        return False, errors
    lines = qramp.split('\n')
    if len(lines) < 3:
        errors.append('Ramp file was missing the minimum number of lines (3)')
        return False, errors

    result = True

    if lines[0].rstrip() != "# QGIS Generated Color Map Export File":
        errors.append(
            'Missing the header line: "# QGIS Generated Color Map Export File". This is probabyl not a QGIS exported color ramp')
        result = False
    if "INTERPOLATION:" not in lines[1]:
        errors.append(
            'Missing the intepolation type on line 2: "INTERPOLATED:[DISCRETE|INTERPOLATED|EXACT]". This is probabyl not a QGIS exported color ramp')
        result = False
    if lines[1].split(':')[1] not in ['DISCRETE', 'EXACT', 'INTERPOLATED']:
        errors.append(
            "Interpolation value must be one of: 'DISCRETE', 'EXACT', 'INTERPOLATED'. Got: {}".format(lines[1]))
        result = False

    pat = "^(.+),([0-9]{1,3},){4}(.+)$"
    for cline in lines[2:]:
        # Blank lines are allowed at the end of the file
        # TODO: right now we're just ignoring blank lines anywhere
        if len(cline.strip()) == 0:
            continue
        if not re.match(pat, cline):
            errors.append(
                'Value line did not match the pattern: "{}". Got: {}'.format(pat, cline))
            result = False

    return result, errors


if __name__ == '__main__':

    xsd_file_test = get_xsd('Projects/XSD/V1/VBET.xsd')
    xml_file_test = get_xsd('Projects/examples/VBET.xml')
    result = validate_xml(xml_file_test, xsd_file_test)

    xmls = collect_files('./Projects/examples')
    results = {}
    for xml in xmls:
        basename = xml.split('.')[0]
        xml_file = get_xml('Projects/examples/{}.xml'.format(basename))
        try:
            xsd_file = get_xsd('Projects/XSD/V1/{}.xsd'.format(basename))
            results[basename] = validate_xml(xml_file, xsd_file)
        except:
            # If there's no XSD for this project then just skip it for now
            pass

    print('hi there')
