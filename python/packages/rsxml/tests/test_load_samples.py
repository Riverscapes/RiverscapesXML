"""Load all the sample XML files and ensure they load OK"""
import unittest
import os
from uuid import uuid4

from rsxml import project_xml


class TestSamples(unittest.TestCase):

    def test_sample(self):

        examples_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', '..', '..', 'Projects', 'XSD', 'V2', 'examples')

        for filename in os.listdir(examples_dir):
            if filename.endswith('Topo.xml'):
                continue

            if filename.endswith('.xml'):
                xml_file_path = os.path.join(examples_dir, filename)
                project = project_xml.Project.load_project(xml_file_path)

        assert True
