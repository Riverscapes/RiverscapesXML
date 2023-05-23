import re
from setuptools import setup, find_packages

# https://packaging.python.org/discussions/install-requires-vs-requirements/
install_requires = [
    'semver>=2.10.2',
    'argparse'
]

with open("README.md", "rb") as f:
    long_descr = f.read().decode("utf-8")

version = re.search(
    '^__version__\\s*=\\s*"(.*)"',
    open('src/__version__.py', encoding='utf8').read(),
    re.M
).group(1)

setup(
    name='rsxml',
    version=version,
    description='Riverscapes XML helpers for use across Python3 open-source GIS Stack',
    author='Matt Reimer',
    license='MIT',
    python_requires='>=3.10.0',
    long_description=long_descr,
    author_email='info@northarrowresearch.com',
    install_requires=install_requires,
    url='https://github.com/Riverscapes/RiverscapesXML',
    packages=find_packages('src'),  # Find packages under the 'src' directory
    package_dir={'': 'src'},  # Specify that the package code is under 'src'
    zip_safe=False,
    classifiers=[
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.10',
        # Add more classifiers relevant to your package
    ],
)
