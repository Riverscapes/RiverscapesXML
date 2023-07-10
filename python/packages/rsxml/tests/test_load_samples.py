"""Load all the sample XML files and ensure they load OK"""
import unittest
import os
from uuid import uuid4

from rsxml import project_xml, validate_project_file


class TestSamples(unittest.TestCase):

    def test_sample(self):
        """
            This runs through and parses all our examples
        """
        examples_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', '..', '..', 'Projects', 'XSD', 'V2', 'examples')

        for filename in os.listdir(examples_dir):
            if filename.endswith('.xml'):
                xml_file_path = os.path.join(examples_dir, filename)

                out_file = os.path.join(os.path.dirname(__file__), 'test_outputs', 'v2', os.path.basename(xml_file_path))
                if os.path.exists(out_file):
                    os.remove(out_file)

                # Throw an exception if we can't load the file
                try:
                    project = project_xml.Project.load_project(xml_file_path)
                except Exception as e:
                    self.fail(f'Failed to load {filename} with error {e}')

                # Now go back and forth to XML and make sure we end up with the same object
                new_xml = project.to_xml()
                project2 = project_xml.Project.from_xml(new_xml)
                self.assertEqual(project, project2)
                # We write the actual files to a git-ignored directory so we can compare them by hand
                project2.write(out_file)

                # Now validate the xml from the input
                result, errors = validate_project_file(out_file)
                self.assertTrue(result, f'Failed to validate {filename} with errors {errors}')
                self.assertEqual(len(errors), 0, f'Failed to validate {filename} with errors {errors}')

        assert True
