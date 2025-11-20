import unittest
from pathlib import Path
import os
import tempfile
from rsxml import util

class UtilPathTest(unittest.TestCase):
    """Tests for safe_remove_dir and safe_makedirs with both str and Path inputs."""

    def setUp(self):
        self.tempdir = tempfile.TemporaryDirectory()
        # One with subdirectories, one without
        self.test_dir_path = Path(self.tempdir.name) / "test_dir_simple"
        self.test_dir_subdir_path = Path(self.tempdir.name) / "foo" / "bar" / "test_dir_subdir"
        self.test_dir_str = str(self.test_dir_path)
        self.test_dir_subdir_str = str(self.test_dir_subdir_path)
        

    def tearDown(self):
        util.safe_remove_dir(self.test_dir_str)
        util.safe_remove_dir(self.test_dir_subdir_str)
        util.safe_remove_dir(self.test_dir_path)

    def test_safe_makedirs_with_str(self):
        # Test simple directory creation
        util.safe_makedirs(self.test_dir_str)
        self.assertTrue(os.path.isdir(self.test_dir_str))
        util.safe_remove_dir(self.test_dir_str)
        self.assertFalse(os.path.exists(self.test_dir_str))

    def test_safe_makedirs_with_subdir_str(self):
        # Test nested directory creation
        util.safe_makedirs(self.test_dir_subdir_str)
        self.assertTrue(os.path.isdir(self.test_dir_subdir_str))
        util.safe_remove_dir(self.test_dir_subdir_str)
        self.assertFalse(os.path.exists(self.test_dir_subdir_str))

    def test_safe_makedirs_with_path(self):
        util.safe_makedirs(self.test_dir_path)
        self.assertTrue(self.test_dir_path.is_dir())
        util.safe_remove_dir(self.test_dir_path)
        self.assertFalse(self.test_dir_path.exists())

    def test_safe_remove_dir_with_path(self):
        self.test_dir_path.mkdir(exist_ok=True)
        self.assertTrue(self.test_dir_path.is_dir())
        util.safe_remove_dir(self.test_dir_path)
        self.assertFalse(self.test_dir_path.exists())

    def test_safe_remove_file_pathstring(self):
        # Create a file and remove it
        test_file = Path(self.tempdir.name) / "test_file.txt"
        test_file.write_text("test content")
        self.assertTrue(test_file.exists())
        util.safe_remove_file(str(test_file))
        self.assertFalse(test_file.exists())

    def test_safe_remove_file_missing_pathstring(self):
        # Try to remove a file that does not exist (should not raise)
        test_file = Path(self.tempdir.name) / "missing_file.txt"
        self.assertFalse(test_file.exists())
        util.safe_remove_file(str(test_file))
        self.assertFalse(test_file.exists())

    def test_safe_remove_file_pathObj(self):
        # Create a file and remove it
        from pathlib import WindowsPath
        test_file = Path(self.tempdir.name) / "test_file.txt"
        test_file.write_text("test content")
        self.assertTrue(test_file.exists())
        # Assert it's a WindowsPath (only on Windows)
        # self.assertIsInstance(test_file, WindowsPath)
        util.safe_remove_file(test_file)
        self.assertFalse(test_file.exists())

    def test_safe_remove_file_missing_pathObj(self):
        # Try to remove a file that does not exist (should not raise)
        test_file = Path(self.tempdir.name) / "missing_file.txt" 
        self.assertFalse(test_file.exists())
        util.safe_remove_file(test_file)
        self.assertFalse(test_file.exists())
        

if __name__ == "__main__":
    unittest.main()
