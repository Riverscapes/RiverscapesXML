""" Testing for validaton module

"""
import unittest
import platform
import os
from rsxml.validation import validate_project_file, validate_xml, fetch_xml
from rsxml import XSD_URL


class Validation(unittest.TestCase):
    """[summary]

    Args:
        unittest ([type]): [description]
    """

    def test_validate_xml(self):
        """[summary]
        """
        xsd_str = fetch_xml(XSD_URL)
        # Open the xml file called data/xml_builder_test.xml in the tests directory
        # and read it into a string
        xml_file = os.path.join(os.path.dirname(__file__), 'xml_builder_test.xml')
        with open(xml_file, 'r') as f:
            xml_str = f.read()

        result, errors = validate_xml(xml_str, xsd_str)
        self.assertTrue(result)
        self.assertEqual(len(errors), 0)

    def test_validate_xml_invalid(self):
        """[summary]
        """
        xsd_str = fetch_xml(XSD_URL)
        # Open the xml file called data/xml_builder_test.xml in the tests directory
        # and read it into a string
        xml_file = os.path.join(os.path.dirname(__file__), 'xml_broken.xml')
        with open(xml_file, 'r') as f:
            xml_str = f.read()

        result, errors = validate_xml(xml_str, xsd_str)
        self.assertFalse(result)
        self.assertEqual(len(errors), 4)
