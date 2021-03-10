import unittest
import json
import sys
import os
from validate import get_xml, get_xmls, get_xsd, validate_xml, validate_xsd
from copy import deepcopy

# We do this mapping because we want the current version's XML tested against the corrent
# version's XSD. 
XML_DIGEST = [
    {'xml': './Programs/**/*.xml', 'xsd': './Program.xsd'},
    {'xml': './RaveBusinessLogic/*.xml', 'xsd': './RaveBusinessLogic/XSD/project_explorer.xsd'}
]

class TestLambdaFunc(unittest.TestCase):
    """
    Our basic test class
    """
    def err_helper(self, errors):
        retval = ''
        for name, errstr in errors:
            retval+= '\n\n[{}] :: {}'.format(name, errstr) 
        return retval

    def test_xmls(self):
        errors = []
        for xml_dig in XML_DIGEST:
            xml_paths = get_xmls(xml_dig['xml'])
            try:
                xsd_file = get_xsd(xml_dig['xsd'])
            except Exception as e:
                errors.append([xml_dig['xsd'], str(e)])
            for xml_path in xml_paths:
                try:
                    xml_file = get_xml(xml_path)
                    result, errs = validate_xml(xml_file, xsd_file)
                    if not result:
                        errors.append([xml_path, str(errs)])
                except Exception as e:
                    errors.append([xml_path, str(e)])

        self.assertEqual(len(errors), 0, msg='Errors were found: \n{}'.format(self.err_helper(errors)))


    def test_allProjectxmls(self):
        """Project XMLs need to be handled differently because each one has a differnt XSD file
        """
        xmls = get_xmls('./Projects/examples/*.xml')
        errors = []
        tested_xsds = []
        for xml_path in xmls:
            basename = os.path.basename(os.path.splitext(xml_path)[0])
            xsd_path='Projects/XSD/V1/{}.xsd'.format(basename)
            
            xml_file = get_xml(xml_path)
            try:
                # If there's no XSD for this project then just skip it for now
                # This is because we can create example XMLS that do other things
                if not os.path.isfile(xsd_path):
                    continue
                tested_xsds.append(xsd_path)
                xsd_file = get_xsd(xsd_path)
                result, errs = validate_xml(xml_file, xsd_file)
                if not result:
                    errors.append([basename, str(errs)])
            except Exception as e:
                errors.append([basename, str(e)])
        self.assertEqual(len(errors), 0, msg='Errors were found: \n{}'.format(self.err_helper(errors)))
        for xsd_path in tested_xsds:
            print("Tested: {}".format(xsd_path))


if __name__ == '__main__':
    unittest.main()
