#! /bin/bash
ENV_NAME=.venv_rsxml

python3 -m virtualenv $ENV_NAME
$ENV_NAME/bin/pip --timeout=120 install -r requirements.txt
