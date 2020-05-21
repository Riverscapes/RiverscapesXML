import unittest
import json
import sys
import os
from validate import get_xml, get_xmls, get_xsd, validate_xml, validate_xsd
from copy import deepcopy



class TestLambdaFunc(unittest.TestCase):
    """
    Our basic test class
    """
    def err_helper(self, errors):
        retval = ''
        for name, errstr in errors:
            retval+= '\n\n[{}] :: {}'.format(name, errstr) 
        return retval

    def test_allxmls(self):
        xmls = get_xmls('./Projects/examples')
        errors = []
        tested_xsds = []
        for xml in xmls:
            basename = xml.split('.')[0]
            xml_path='Projects/examples/{}.xml'.format(basename)
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
