#! /bin/bash
set -eu

# On OSX you must have run `brew install gdal` so that the header files are findable 
python3 --version
python3 -m venv .venv
# Make sure pip is at a good version
.venv/bin/python3 -m pip install --upgrade pip

# Now install everything else
.venv/bin/pip --timeout=120 install -r requirements.dev.txt