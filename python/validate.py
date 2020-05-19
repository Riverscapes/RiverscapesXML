import sys
import os
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

def get_xmls(dir_path):
    xml_files = [f for f in os.listdir(dir_path) if os.path.isfile(os.path.join(dir_path, f)) and f.endswith('.xml')]
    return xml_files

def get_xml(xml_path):
    with open(xml_path) as xsd_file:
        xml = xsd_file.read()
    return xml

def validate_xml(xml_str: str, xsd_str: str) -> bool:
    parser = etree.XMLParser(ns_clean=True, recover=True, encoding='utf-8')
    xmlschema_doc = etree.fromstring(xsd_str, parser=parser)
    xmlschema = etree.XMLSchema(xmlschema_doc)

    xml_doc = etree.fromstring(xml_str.encode('utf-8'), parser=parser)
    result = xmlschema.validate(xml_doc)

    return result, xmlschema.error_log

def validate_xsd(xsd_str: str) -> bool:
    parser = etree.XMLParser(ns_clean=True, recover=True, encoding='utf-8')
    etree.fromstring(xsd_str, parser=parser)
    errors = list(parser.error_log)
    return errors


if __name__ == '__main__':

    xsd_file_test = get_xsd('Projects/XSD/V1/VBET.xsd')
    xml_file_test = get_xsd('Projects/examples/VBET.xml')
    result = validate_xml(xml_file_test, xsd_file_test)


    xmls = get_xmls('./Projects/examples')
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
