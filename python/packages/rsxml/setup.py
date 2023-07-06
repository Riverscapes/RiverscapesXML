import re
from setuptools import setup

# https://packaging.python.org/discussions/install-requires-vs-requirements/
install_requires = [
    'lxml>=4.9.2',
    'requests>=2.31.0',
    'urllib3>=2.0.2',
    'semver>=2.10.2',
]

with open("README.md", "rb") as f:
    long_description = f.read().decode("utf-8")


version = re.search(
    '^__version__\\s*=\\s*"(.*)"',
    open('rsxml/__version__.py', encoding='utf8').read(),
    re.M
).group(1)

setup(
    name='rsxml',
    version=version,
    description='Riverscapes XML helpers for use across Python3 open-source GIS Stack',
    author='Matt Reimer',
    license='MIT',
    python_requires='>=3.9.0',
    long_description=long_description,
    long_description_content_type="text/markdown",
    author_email='info@northarrowresearch.com',
    install_requires=install_requires,
    url='https://github.com/Riverscapes/RiverscapesXML',
    packages=[
        'rsxml',
        'rsxml.logging',
        'rsxml.debug',
        'rsxml.project_xml'
    ],
    zip_safe=False,
    classifiers=[
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.10',
        # Add more classifiers relevant to your package
    ],
)
