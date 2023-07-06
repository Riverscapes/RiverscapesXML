"""Parse a .env file and return a dictionary of the values"""
import codecs
from typing import Dict
import re
import os
from pathlib import Path


def has_argparse():
    # Try to load argparse and fall back
    try:
        import argparse
    except ImportError:
        raise Exception('argparse is required for this library. Please install it with `pip install argparse`')


def parse_dotenv(dotenv_path):
    """Given a path to a dotenv file, return that file as a dictionary

    Args:
        dotenv_path ([type]): [description]

    Returns:
        [type]: [description]
    """
    results = {}
    has_argparse()
    # We fall back gracefully if there's no file there
    if not os.path.exists(dotenv_path):
        return results
    with open(dotenv_path, encoding="utf8") as f:
        for line in f:
            line = line.strip()
            # Ignore any line that starts with '#'
            if not line or line.startswith('#') or '=' not in line:
                continue
            k, v = line.split('=', 1)

            # Remove any leading and trailing spaces in key, value
            k, v = k.strip(), v.strip().encode('unicode-escape').decode('ascii')
            if len(v) > 0:
                quoted = v[0] == v[len(v) - 1] in ['"', "'"]

                if quoted:
                    v = codecs.getdecoder('unicode_escape')(v[1:-1])[0]
            results[k] = v.strip()
    return results


def parse_args_env(parser, env_path=None, args=None):
    """Parse the arguments and environment variables

    Args:
        parser (argparse.ArgumentParser): [description]
        env_path ([type], optional): path to .env file. Defaults to None.
        args ([type], optional): Good for testing values other than sys.argv. Defaults to None.
    """
    has_argparse()
    _env = parse_dotenv(env_path) if env_path is not None else {}
    args = parser.parse_args(args)
    pattern = r'{env:([^}]+)}'

    # Try and make substitutions for all the {env:ENVNAME} parameters we find
    for k, v in vars(args).items():
        new_val = replace_env_vars(pattern, v, {**dict(os.environ), **_env})
        setattr(args, k, new_val)

    return args


def replace_env_vars(pattern: str, value_str: str, env: Dict[str, str]):
    """_summary_

    Args:
        pattern (str): _description_
        value_str (str): _description_
        env (Dict[str, str]): _description_

    Raises:
        Exception: _description_

    Returns:
        _type_: _description_
    """
    if isinstance(value_str, str):
        new_str = value_str

        def replace(msg_str):
            envname = msg_str.group(1)
            if envname in env:
                sub = env[envname]
            elif envname in os.environ:
                sub = os.environ[envname]
            else:
                raise Exception(f'COULD NOT FIND ENVIRONMENT VARIABLE: {envname}')
            # Finally, make the substitution
            return sub.replace("\\", "/")

        new_str = str(Path(re.sub(pattern, replace, new_str)))

        return new_str
    else:
        return value_str
