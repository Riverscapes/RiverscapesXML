"""[summary]"""
import unittest
import tempfile
import argparse

from src.dotenv import parse_args_env, parse_dotenv


class DotEnvTest(unittest.TestCase):
    """[summary]"""

    def test_parse_dotenv(self):
        """[summary]
        """

        # Now parse the .env file and make sure we get the right values
        with tempfile.NamedTemporaryFile(mode='w+', delete=False) as tmp:
            tmp.write('TEST_VAR=test_value\nTEST_VAR2=test_value2\n')
            tmp.close()
            env = parse_dotenv(tmp.file.name)
            self.assertEqual(env['TEST_VAR'], 'test_value')
            self.assertEqual(env['TEST_VAR2'], 'test_value2')

        # It should handle quotes as well
        with tempfile.NamedTemporaryFile(mode='w+', delete=False) as tmp:
            tmp.write('TEST_VARQ="test_value"\nTEST_VAR2Q=\'test_value2\'\n')
            tmp.close()
            env = parse_dotenv(tmp.file.name)
            self.assertEqual(env['TEST_VARQ'], 'test_value')
            self.assertEqual(env['TEST_VAR2Q'], 'test_value2')

        # it should handle spaces as well
        with tempfile.NamedTemporaryFile(mode='w+', delete=False) as tmp:
            tmp.write('TEST_VARSP= "test value "\n TEST_VAR2SP = \'   test value2\'\n')
            tmp.close()
            env = parse_dotenv(tmp.file.name)
            self.assertEqual(env['TEST_VARSP'], 'test value')
            self.assertEqual(env['TEST_VAR2SP'], 'test value2')

    def test_parse_args_env(self):
        """[summary]
        """
        # Now parse the .env file and make sure we get the right values
        with tempfile.NamedTemporaryFile(mode='w+', delete=False) as tmp:
            tmp.write('TEST_VAR=test_value\nTEST_VAR2=test_value2\n')
            tmp.close()

            args = argparse.ArgumentParser()
            args.add_argument('--test-var', type=str, default='{env:TEST_VAR}')
            args.add_argument('--test-var2', type=str, default='{env:TEST_VAR2}')

            # Now parse the .env file and make sure we get the right values
            env = parse_args_env(args, tmp.file.name, [
                '--test-var', '{env:TEST_VAR}',
                '--test-var2', '{env:TEST_VAR2}'
            ])
            self.assertEqual(env.test_var, 'test_value')
            self.assertEqual(env.test_var2, 'test_value2')
