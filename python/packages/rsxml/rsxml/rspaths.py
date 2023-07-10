""" handling of paths across operating systems
"""
from __future__ import annotations
import re
import os
from typing import List
from pathlib import Path, PurePosixPath


def parse_rel_path(path: str) -> str:
    """ Path handling across platforms is gnarly.
    This method returns the correct path for your operating system regardless of
    whether the input is a windows path or a linux path

    Args:
        path ([type]): [description]

    Returns:
        [type]: [description]
    """
    new_path = Path(path.replace('\\', '/')).resolve()
    return str(new_path)


def parse_posix_path(path: str) -> str:
    """This method returns a posix path no matter if you pass it a windows or a linux path

    Args:
        path ([type]): [description]
    """
    new_path = PurePosixPath(path.replace('\\', '/'))
    return str(new_path)


def get_sidecar_files(file_list: List[str], ds_rel_path: str):
    """ get all the sidecar files for a given dataset path

    Args:
        file_list (List[str]): _description_
        ds_rel_path (str): _description_
    """
    basepath = os.path.splitext(ds_rel_path)[0]
    path_escaped = re.escape(basepath)
    pattern = re.compile('^' + path_escaped + '(\\.[\\w]{1,3})+$')
    sidecar_files = [file for file in file_list if re.match(pattern, file)]
    return sidecar_files
