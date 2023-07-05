"""
Example demonstrating how to load an existing project XML file
and validate it to ensure that it meets the requirements of the
Riverscapes XSD schema.
"""
# in your code you woulf write:
# from riverscapes import rsxml
from rsxml.project_xml import (
    Project,
    Dataset,
)
from rsxml import Logger
from datetime import date
from rsxml import validate_project_file

if __name__ == '__main__':

    log = Logger('Project')

    xml_file = 'project.rs.xml'

    result, errors = validate_project_file(xml_file)
    log.info(f'Passed: {result}')
    for err in list(errors):
        log.info(f'Error: {err}')

    log.info('done')
