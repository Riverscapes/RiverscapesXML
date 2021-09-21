#! /bin/bash
ENV_NAME=.venv_rsxml

python3 -m venv $ENV_NAME
$ENV_NAME/bin/pip --timeout=120 install -r requirements.txt
