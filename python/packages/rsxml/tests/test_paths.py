""" Testing for the vector ops

"""
import unittest
import platform
import os

from rsxml.rspaths import parse_posix_path, parse_rel_path, get_sidecar_files

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

    def test_get_sidecar_files(self):
        file_list = [
            'dataset/images/file.shp',
            'dataset/images/file.aux.xml',
            'dataset/images/file.xml',
            'dataset/images/file.hst',
            'dataset/images/file2.shp',
            'dataset/images/image2.jpg',
            'dataset/images/image2.txt',
            'dataset/images/image3.jpg',
            'dataset/images/video1.mp4',
            'dataset/images/video1.txt',
        ]
        ds_path = 'dataset/images/file.shp'

        expected_sidecar_files = [
            'dataset/images/file.shp',
            'dataset/images/file.aux.xml',
            'dataset/images/file.xml',
            'dataset/images/file.hst',
        ]

        sidecar_files = get_sidecar_files(file_list, ds_path)
        self.assertListEqual(sidecar_files, expected_sidecar_files)

    def test_get_sidecar_files_no_sidecars(self):
        file_list = [
            'dataset/images/file.shp',
            'dataset/images/file.aux.xml',
            'dataset/images/file.xml',
            'dataset/images/file.hst',
            'dataset/images/file2.shp',
            'dataset/images/image2.jpg',
            'dataset/images/image2.txt',
            'dataset/images/image3.jpg',
            'dataset/images/video1.mp4',
            'dataset/images/video1.txt',
        ]
        ds_path = 'dataset/images/file2.shp'

        expected_sidecar_files = [
            'dataset/images/file2.shp'
        ]

        sidecar_files = get_sidecar_files(file_list, ds_path)
        self.assertListEqual(sidecar_files, expected_sidecar_files)
