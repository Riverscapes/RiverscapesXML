#!/usr/bin/env python
# Notes; colored and matplotlib are optional

import re
from setuptools import setup

# https://packaging.python.org/discussions/install-requires-vs-requirements/
install_requires = [
    'semver>=2.10.2', 'argparse'
]

with open("README.md", "rb") as f:
    long_descr = f.read().decode("utf-8")

version = re.search(
    '^__version__\\s*=\\s*"(.*)"',
    open('src/__version__.py', encoding='utf8').read(),
    re.M
).group(1)

setup(name='rsxml',
      version=version,
      description='Riverscapes XML helpers for use across Python3 open-source GIS Stack',
      author='Matt Reimer',
      license='MIT',
      python_requires='>3.5.2',
      long_description=long_descr,
      author_email='info@northarrowresearch.com',
      install_requires=install_requires,
      zip_safe=False,
      url='https://github.com/Riverscapes/RiverscapesXML',
      packages=[
          'src',
      ],
      )
