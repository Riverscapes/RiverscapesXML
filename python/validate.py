import glob
from lxml import etree
import json


def get_xsd(xsd_path):
    """We need to replace the absolute XSD reference by hand so this is where that happens
    """
    with open(xsd_path) as xsd_file:
        xsd = xsd_file.read()
    xsd = xsd.replace('http://xml.riverscapes.xyz/', './')
    xsd_encoded = bytes(xsd, encoding='utf-8')
    errors = validate_xsd(xsd_encoded)
    if len(errors) > 0:
        raise Exception('XSD Failed to validate: {} \n {}'.format(xsd_path, errors))
    return xsd_encoded

def collect_files(dir_glob):
    xml_files = glob.glob(dir_glob)
    return xml_files

def get_xml(xml_path):
    with open(xml_path) as xsd_file:
        xml = xsd_file.read()
    return xml

def validate_xml(xml_str: str, xsd_str: str):
    parser = etree.XMLParser(ns_clean=True, recover=True, encoding='utf-8')
    xmlschema_doc = etree.fromstring(xsd_str, parser=parser)
    xmlschema = etree.XMLSchema(xmlschema_doc)

    xml_doc = etree.fromstring(xml_str.encode('utf-8'), parser=parser)
    result = xmlschema.validate(xml_doc)

    return result, xmlschema.error_log

def validate_xsd(xsd_str: str):
    parser = etree.XMLParser(ns_clean=True, recover=True, encoding='utf-8')
    etree.fromstring(xsd_str, parser=parser)
    errors = list(parser.error_log)
    return errors

def validate_web_vector_json(json_obj: list) -> bool:
    result = True
    errors = []
    if not isinstance(json_obj, list):
        result = False
        errors.append('Json root object must be an array')
    elif len(json_obj) <1:
        result = False
        errors.append('Symbology array cannot be empty')
    else:
        for o in json_obj:
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
                        errors.append('You cannot use mapbox layers: {}'.format(json.dumps(o)))
                    elif o['type'] == 'raster':
                        result = False
                        errors.append('Found a raster in your symbology. This is not allowed: {}'.format(json.dumps(o)))
            if result is True:
                unique_sources = list(dict.fromkeys([k['source-layer'] for k in json_obj]))
                if len(unique_sources) != 1:
                    result = False
                    errors.append('You cannot consume from multiple sources: {}'.format(unique_sources))
    return result, errors

# TODO: COLOR RAMPS ARE MORE COMPLICATED THAN JUST A CSV
# def validate_ramp_txt(ramp: list):
#     result = True
#     errors = []
#     if not isinstance(ramp, list):
#         result = False
#         errors.append('Ramp must be a valid CSV file')
#     elif len(ramp) <2:
#         result = False
#         errors.append('Ramp object must have at least 2 rows')
#     pass

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
