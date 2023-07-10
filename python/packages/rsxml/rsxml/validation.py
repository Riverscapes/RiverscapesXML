"""_summary_"""
from __future__ import annotations
from typing import List
import requests
from io import BytesIO
try:
    from lxml import etree
except ImportError:
    etree = None
from rsxml import Logger
from rsxml.constants import XSD_URL


def fetch_xml(xml_url: str):
    """_summary_

    Args:
        xml_url (str): _description_

    Raises:
        e: _description_

    Returns:
        _type_: _description_
    """
    log = Logger('get_xsd')
    # fetch an xml file from the internet using the url https://xml.riverscapes.net/Project.xsd
    # and return the contents as a string
    try:
        xsd = requests.get(xml_url).text
    except Exception as e:
        log.error(f'Could not fetch XML from {xml_url}')
        raise e

    # Admitedly this is a bit hack-y but it works for now so....
    # xsd = xsd.replace('https://xml.riverscapes.net/', './')
    return bytes(xsd, encoding='utf-8')


def validate_xml(xml_str: str, xsd_str: str):

    if etree is None:
        raise ImportError('lxml is not installed. You need it to validate XML files')

    parser = etree.XMLParser(ns_clean=True, recover=False, encoding='utf-8')
    xmlschema_doc = etree.fromstring(xsd_str, parser=parser)
    xmlschema = etree.XMLSchema(xmlschema_doc)

    xml_doc = etree.parse(BytesIO(xml_str.encode()), parser=parser)
    result = xmlschema.validate(xml_doc)

    return result, xmlschema.error_log


def validate_project_file(project_file_path: str):
    """_summary_

    Args:
        project_file (str): _description_

    Raises:
        e: _description_
        e: _description_

    Returns:
        _type_: _description_
    """
    log = Logger('validate_project_file')
    try:
        xsd = fetch_xml(XSD_URL)
    except Exception as e:
        log.error(f'Could not fetch XSD from {XSD_URL}')
        raise e

    try:
        with open(project_file_path, 'r') as f:
            xml = f.read()
    except Exception as e:
        log.error(f'Could not read XML file {project_file_path}')
        raise e

    return validate_xml(xml, xsd)

