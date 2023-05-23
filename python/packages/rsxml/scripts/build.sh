#!/bin/bash
# This script builds the python package
# It should be run from the root of the project

# remove old version
rm -rf dist/*

# build new version

python setup.py sdist bdist_wheel
