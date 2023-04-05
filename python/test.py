import unittest
import json
# import sys
# import csv
import os
from validate import get_xml, collect_files, get_xsd, validate_web_vector_json, validate_xml, validate_qramp

# We do this mapping because we want the current version's XML tested against the corrent
# version's XSD.
XML_DIGEST = [
    {'xml': './Programs/**/*.xml', 'xsd': './Program.xsd'},
    {'xml': './RaveBusinessLogic/*.xml',
        'xsd': './RaveBusinessLogic/XSD/project_explorer.xsd'},
    {'xml': './RaveBusinessLogic/V2/*.xml',
        'xsd': './RaveBusinessLogic/XSD/project_explorer.xsd'},
    {'xml': './BaseMaps.xml', 'xsd': './BaseMaps.xsd'}
]


class TestLambdaFunc(unittest.TestCase):
    """
    Our basic test class
    """

    def err_helper(self, errors):
        retval = ''
        for name, errstr in errors:
            retval += '\n\n[{}] :: {}'.format(name, errstr)
        return retval

    def test_xmls(self):
        errors = []
        for xml_dig in XML_DIGEST:
            print("\nTesting XML Files with pattern {}:\n===================================".format(
                xml_dig['xml']))
            xml_paths = collect_files(xml_dig['xml'])
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
                print("Tested XML: {}".format(xml_path))

        self.assertEqual(len(errors), 0, msg='Errors were found: \n{}'.format(
            self.err_helper(errors)))

    def test_validateJSON(self):
        """We have some JSON in the system that needs validating
        """
        errors = []
        json_paths = collect_files('./Symbology/web/**/*.json')
        with open('./Symbology/web/vector.schema.json') as f:
            schema = json.load(f)
        print("\nTesting Web Symbologies:\n========================")
        for json_path in json_paths:
            try:
                with open(json_path, 'r') as f:
                    json_file = json.load(f)
                result, errs = validate_web_vector_json(json_file, schema)
                if not result:
                    errors.append([json_path, str(errs)])
            except Exception as e:
                errors.append([json_path, str(e)])
            print("Tested web symbology: {}".format(json_path))

        self.assertEqual(len(errors), 0, msg='Errors were found: \n{}'.format(
            self.err_helper(errors)))

    def test_validateRamp(self):
        """QGIS Color Ramps follow a very particular type
        """
        errors = []
        ramp_paths = collect_files('./Symbology/web/**/*.txt')
        for ramp_path in ramp_paths:
            try:
                with open(ramp_path, 'r') as data:
                    ramp_file = data.read()
                result, errs = validate_qramp(ramp_file)
                if not result:
                    errors.append([ramp_path, str(errs)])
            except Exception as e:
                errors.append(
                    [ramp_path, 'Error parsing QGIS Color Ramp: {}'.format(str(e))])

        self.assertEqual(len(errors), 0, msg='Errors were found: \n{}'.format(
            self.err_helper(errors)))

    def test_allProjectxmls(self):
        """Project XMLs need to be handled differently because each one has a different XSD file
        """

        for ver in ['V1', 'V2']:
            errors = []
            tested_xsds = []
            print("\nTesting Project XMLS {}:\n========================".format(ver))
            xmls = collect_files('./Projects/XSD/{}/examples/*.xml'.format(ver))
            for xml_path in xmls:
                basename = os.path.basename(os.path.splitext(xml_path)[0])
                if (ver == 'V1'):
                    xsd_path = 'Projects/XSD/{}/{}.xsd'.format(ver, basename)
                else:
                    xsd_path = 'Projects/XSD/{}/RiverscapesProject.xsd'.format(ver, basename)
                xml_file = get_xml(xml_path)
                try:
                    # If there's no XSD for this project then just skip it for now
                    # This is because we can create example XMLS that do other things
                    print("Tested project xml: {}".format(xml_path))
                    if not os.path.isfile(xsd_path):
                        continue
                    tested_xsds.append(xsd_path)
                    xsd_file = get_xsd(xsd_path)
                    result, errs = validate_xml(xml_file, xsd_file)
                    if not result:
                        errors.append([xml_path, str(errs)])
                except Exception as e:
                    errors.append([xml_path, str(e)])

            print("\nTesting Project XSDs {}:\n========================".format(ver))
            self.assertEqual(len(errors), 0, msg='Errors were found: \n{}'.format(
                self.err_helper(errors)))
            for xsd_path in tested_xsds:
                print("Tested project xsd: {}".format(xsd_path))


if __name__ == '__main__':
    unittest.main()
