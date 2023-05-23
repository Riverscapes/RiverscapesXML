""" Testing for the vector ops

"""
import unittest
import os

from src.etag import calculate_etag
from src.dotenv import parse_dotenv


class EtagTests(unittest.TestCase):
    """[summary]

    Args:
        unittest ([type]): [description]
    """

    def test_calculate_etag(self):
        """[summary]
        """
        env = parse_dotenv(os.path.join(os.path.dirname(__file__), '..', '.env'))

        if not env or 'ETAG_TEST_DATA' not in env or not os.path.exists(env['ETAG_TEST_DATA']):
            self.skipTest('ETAG_TEST_DATA not found in .env file.')

        data_dir = env['ETAG_TEST_DATA']

        etag_verify = {
            'cat.jpg': '"a7eac640e7a66bdb9a0855c5137c81e5"',
            '5mb.zip': '"91eccd44f01401d67e88ffab3ed9bb29"',
            '100Mb.zip': '"bcae7ed6c3162532280c2a5447ba9484-2"',
            '262Mb.zip': '"f028a132dcd7c2180b4bd530ce952a8f-6"',
            '2Gb.zip': '"b61fe85ee6b4ab829b568c5f4453e95c-41"',
        }
        for filename, etag in etag_verify.items():
            filename = os.path.join(data_dir, filename)
            self.assertEqual(etag, calculate_etag(filename))
