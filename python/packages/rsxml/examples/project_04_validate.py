import os
# import json
from rsxml import Logger
from rsxml.validation import validate_project_file
from rsxml.project_xml import ProjectValidation


def main():
    """ This validation is just raw XML validation to make sure the project file matches the XSD
    for riverscapes
    """
    log = Logger('validate')

    # First let's see it pass
    # ==================================
    # Open the xml file called data/xml_builder_test.xml in the tests directory
    # and read it into a string
    xml_file = os.path.join(os.path.dirname(__file__), 'project_04_inputs_VALID.rs.xml')

    result, errors = validate_project_file(xml_file)
    log.info(f'Passed: {result}')
    for err in list(errors):
        log.info(f'Error: {err}')

    # OUTPUT
    # [info] [validate] Passed: True

    # Ok, now let's see it fail
    # ==================================
    xml_file = os.path.join(os.path.dirname(__file__), 'project_04_inputs_NOT_VALID.rs.xml')

    # The errors are rich objects that can tell you w
    result, errors = validate_project_file(xml_file)
    log.info(f'Passed: {result}')
    for err in list(errors):
        log.info(f'Error: {err}')

    # Output
    # [info] [validate] Passed: False
    # [info] [validate] Error: <string>:20:0:ERROR:SCHEMASV:SCHEMAV_ELEMENT_CONTENT: Element 'Moota': This element is not expected. Expected is ( Meta ).
    # [info] [validate] Error: <string>:47:0:ERROR:SCHEMASV:SCHEMAV_CVC_PATTERN_VALID: Element 'Vector', attribute 'id': [facet 'pattern'] The value '  BreaklineDXF' is not accepted by the pattern '[A-Za-z0-9_-]+'.
    # [info] [validate] Error: <string>:47:0:ERROR:SCHEMASV:SCHEMAV_CVC_IDC: Element 'Vector', attribute 'id': Warning: No precomputed value available, the value was either invalid or something strange happened.
    # [info] [validate] Error: <string>:327:0:ERROR:SCHEMASV:SCHEMAV_ELEMENT_CONTENT: Element 'notInProject': This element is not expected. Expected is ( MetaData ).

    # Note that Errors are rich objects (lxml.etree._LogEntry)
    # they can tell you where the error is in your xml like:
    #     err.line, err.column, err.level, err.domain, err.type, err.message

    # We can also do a more thorough validation to make sure our project folders are ok
    # ==================================
    validation = ProjectValidation('/Users/matt/Downloads/16010202/')
    print('yes')


if __name__ == '__main__':
    main()
