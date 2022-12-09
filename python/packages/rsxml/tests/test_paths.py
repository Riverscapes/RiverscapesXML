""" Testing for the vector ops

"""
import unittest
import platform
import os

from src.rspaths import parse_posix_path, parse_rel_path

IS_WINDOWS = platform.system() == 'Windows'


class RSPathTests(unittest.TestCase):
    """[summary]

    Args:
        unittest ([type]): [description]
    """

    def test_parse_posix_path(self):
        """[summary]
        """
        # Linux style paths
        path = '/some/path/to/a/file'
        path_parts = parse_posix_path(path)
        self.assertEqual(path_parts, '/some/path/to/a/file')

        # Windows style paths
        path = 'C:\\some\\path\\to\\a\\file'
        path_parts = parse_posix_path(path)
        self.assertEqual(path_parts, 'C:/some/path/to/a/file')

    def test_parse_rel_path(self):
        """[summary]
        """

        # Linux style paths
        path = 'some/path/to/a/file'
        path_parts = parse_rel_path(path)
        self.assertEqual(path_parts, os.path.join(os.getcwd(), 'some/path/to/a/file'))

        # Windows style paths
        path = 'some\\path\\to\\a\\file'
        path_parts = parse_rel_path(path)

        if IS_WINDOWS:
            self.assertEqual(path_parts, os.path.join(os.getcwd(), 'some\\path\\to\\a\\file'))
        else:
            self.assertEqual(path_parts, os.path.join(os.getcwd(), 'some/path/to/a/file'))
