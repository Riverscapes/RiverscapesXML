import os
import json
import unittest
# import sys
# import csv
from validate import get_xml, collect_files, get_xsd, validate_web_vector_json, validate_xml, validate_qramp, validate_qris_metric_json

# We do this mapping because we want the current version's XML tested against the corrent
# version's XSD.
XML_DIGEST = [
    {'xml': './Programs/**/*.xml', 'xsd': './Program.xsd'},
    {'xml': './RaveBusinessLogic/*.xml', 'xsd': './RaveBusinessLogic/XSD/project_explorer.xsd'},
    {'xml': './RaveBusinessLogic/V2/*.xml', 'xsd': './RaveBusinessLogic/XSD/project_explorer.xsd'},
    {'xml': './BaseMaps.xml', 'xsd': './BaseMaps.xsd'},
    {'xml': './QRiS/protocols/*.xml', 'xsd': './QRiS/protocol.xsd'}
]


class TestLambdaFunc(unittest.TestCase):
    """
    Our basic test class
    """

    def err_helper(self, errors):
        """Helper function to format errors"""
        retval = ''
        for name, errstr in errors:
            retval += f'\n\n[{name}] :: {errstr}'
        return retval

    def test_xmls(self):
        """We have a bunch of XML files that need to be validated"""
        errors = []
        for xml_dig in XML_DIGEST:
            print(f"\nTesting XML Files with pattern {xml_dig['xml']}:\n===================================")
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
                print(f"Tested XML: {xml_path}")

        self.assertEqual(len(errors), 0, msg=f'Errors were found: \n{self.err_helper(errors)}')

    def test_validateJSON(self):
        """We have some JSON in the system that needs validating
        """
        errors = []

        print("\nTesting Web Symbologies:\n========================")
        with open('./Symbology/web/vector.schema.json', encoding='utf-8') as f:
            symbology_paths = collect_files('./Symbology/web/**/*.json')
            schema = json.load(f)

            for json_path in symbology_paths:
                try:
                    with open(json_path, 'r', encoding='utf-8') as f:
                        json_file = json.load(f)
                    result, errs = validate_web_vector_json(json_file, schema)
                    if not result:
                        errors.append([json_path, str(errs)])
                except Exception as e:
                    errors.append([json_path, str(e)])
                print(f"Tested web symbology: {json_path}")

        print("\nTesting QRiS Metrics:\n========================")
        with open('./QRiS/qris_metrics.schema.json', encoding='utf-8') as f:
            metric_paths = [
                *collect_files('./QRiS/metrics/*.json'),
                *collect_files('./QRiS/metrics/**/*.json'),
            ]
            schema = json.load(f)

            for json_path in metric_paths:
                try:
                    with open(json_path, 'r', encoding='utf-8') as f:
                        json_file = json.load(f)
                    result, errs = validate_qris_metric_json(json_file, schema)
                    if not result:
                        errors.append([json_path, str(errs)])
                except Exception as e:
                    errors.append([json_path, str(e)])
                print(f"Tested QRiS Metric: {json_path}")

        self.assertEqual(len(errors), 0, msg=f'Errors were found: \n{self.err_helper(errors)}')

    def test_validateRamp(self):
        """QGIS Color Ramps follow a very particular type
        """
        errors = []
        ramp_paths = collect_files('./Symbology/web/**/*.txt')
        for ramp_path in ramp_paths:
            try:
                with open(ramp_path, 'r', encoding='utf-8') as data:
                    ramp_file = data.read()
                result, errs = validate_qramp(ramp_file)
                if not result:
                    errors.append([ramp_path, str(errs)])
            except Exception as e:
                errors.append(
                    [ramp_path, f'Error parsing QGIS Color Ramp: {str(e)}'])

        self.assertEqual(len(errors), 0, msg=f'Errors were found: \n{self.err_helper(errors)}')

    def test_allProjectxmls(self):
        """Project XMLs need to be handled differently because each one has a different XSD file
        """

        for ver in ['V1', 'V2']:
            errors = []
            tested_xsds = []
            print(f"\nTesting Project XMLS {ver}:\n========================")
            xmls = collect_files(f'./Projects/XSD/{ver}/examples/*.xml')
            for xml_path in xmls:
                basename = os.path.basename(os.path.splitext(xml_path)[0])
                if ver == 'V1':
                    xsd_path = f'Projects/XSD/{ver}/{basename}.xsd'
                else:
                    xsd_path = f'Projects/XSD/{ver}/RiverscapesProject.xsd'
                xml_file = get_xml(xml_path)
                try:
                    # If there's no XSD for this project then just skip it for now
                    # This is because we can create example XMLS that do other things
                    print(f"Tested project xml: {xml_path}")
                    if not os.path.isfile(xsd_path):
                        continue
                    tested_xsds.append(xsd_path)
                    xsd_file = get_xsd(xsd_path)
                    result, errs = validate_xml(xml_file, xsd_file)
                    if not result:
                        errors.append([xml_path, str(errs)])
                except Exception as e:
                    errors.append([xml_path, str(e)])

            print(f"\nTesting Project XSDs {ver}:\n========================")
            self.assertEqual(len(errors), 0, msg=f'Errors were found: \n{self.err_helper(errors)}')
            for xsd_path in tested_xsds:
                print(f"Tested project xsd: {xsd_path}")


if __name__ == '__main__':
    unittest.main()
