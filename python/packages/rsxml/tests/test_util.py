""" Testing for the vector ops

"""
import unittest
from src import util


class UtilTest(unittest.TestCase):
    """[summary]

    Args:
        unittest ([type]): [description]
    """

    def test_pretty_duration(self):
        """[summary]
        """
        self.assertEqual(util.pretty_duration(0), '0.0 seconds')
        self.assertEqual(util.pretty_duration(10), '10.0 seconds')
        self.assertEqual(util.pretty_duration(100), '1:40 minutes')
        self.assertEqual(util.pretty_duration(103.234234), '1:43 minutes')
        self.assertEqual(util.pretty_duration(1000), '16:40 minutes')
        self.assertEqual(util.pretty_duration(10000), '2:46 hours')
        self.assertEqual(util.pretty_duration(100000), '1 days, 3:46 hours')

    def test_batch(self):
        """[summary]
        """
        self.assertEqual(list(util.batch([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3)),
                         [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]])

    def test_sizeof_fmt(self):
        """[summary]
        """
        self.assertEqual(util.sizeof_fmt(0), '0.0 B')
        self.assertEqual(util.sizeof_fmt(10), '10.0 B')
        self.assertEqual(util.sizeof_fmt(100), '100.0 B')
        self.assertEqual(util.sizeof_fmt(1000), '1000.0 B')
        self.assertEqual(util.sizeof_fmt(10000), '10.0 KB')
        self.assertEqual(util.sizeof_fmt(100000), '100.0 KB')
        self.assertEqual(util.sizeof_fmt(1000000), '1000.0 KB')
        self.assertEqual(util.sizeof_fmt(10000000), '10.0 MB')
        self.assertEqual(util.sizeof_fmt(100000000), '100.0 MB')
        self.assertEqual(util.sizeof_fmt(1000000000), '1000.0 MB')
        self.assertEqual(util.sizeof_fmt(10000000000), '10.0 GB')
        self.assertEqual(util.sizeof_fmt(100000000000), '100.0 GB')
        self.assertEqual(util.sizeof_fmt(1000000000000), '1000.0 GB')
        self.assertEqual(util.sizeof_fmt(10000000000000), '10.0 TB')
        self.assertEqual(util.sizeof_fmt(100000000000000), '100.0 TB')
        self.assertEqual(util.sizeof_fmt(1000000000000000), '1000.0 TB')
        self.assertEqual(util.sizeof_fmt(10000000000000000), '10.0 PB')
        self.assertEqual(util.sizeof_fmt(100000000000000000), '100.0 PB')
        self.assertEqual(util.sizeof_fmt(1000000000000000000), '1000.0 PB')
        self.assertEqual(util.sizeof_fmt(10000000000000000000), '10.0 EB')
        self.assertEqual(util.sizeof_fmt(100000000000000000000), '100.0 EB')
        self.assertEqual(util.sizeof_fmt(1000000000000000000000), '1000.0 EB')
        self.assertEqual(util.sizeof_fmt(10000000000000000000000), '10.0 ZB')
        self.assertEqual(util.sizeof_fmt(100000000000000000000000), '100.0 ZB')

    def test_get_obj_size(self):

        self.assertEqual(util.get_obj_size(None), 16)
        self.assertEqual(util.get_obj_size(0), 24)
        self.assertEqual(util.get_obj_size([1, 2, 3, 4]), 200)
        self.assertEqual(util.get_obj_size({"key": "value"}), 286)

    def test_parse_metadata(self):
        """[summary]
        """
        self.assertEqual(util.parse_metadata("key=value"), {"key": "value"})
        self.assertEqual(util.parse_metadata("key=value,key2=value2"),
                         {"key": "value", "key2": "value2"})
