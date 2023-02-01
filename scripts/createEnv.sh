#! /bin/bash
set -eu

# On OSX you must have run `brew install gdal` so that the header files are findable 
python3 --version
python3 -m venv .venv
# Make sure pip is at a good version
.venv/bin/python3 -m pip install --upgrade pip

# Now install everything else
.venv/bin/pip --timeout=120 install -r python/requirements.dev.txt


# Iterate the string array using for loop
ORIGPWD=`pwd`

# Symlinking the .venv is useful for VSCode workspaces 
# trying to find the python interpreter automatically
array=( "python/packages/rsxml" "python")
for tooldir in "${array[@]}" ; do 
  # Install our packages as being editable
  # .venv/bin/pip install -e $tooldir
  cd $tooldir
  ln -sf ../../.venv
  cd $ORIGPWD
done
