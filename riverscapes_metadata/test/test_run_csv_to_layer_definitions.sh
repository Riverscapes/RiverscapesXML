# this is a "smoke test" for the csv_to_layer_definitions
# run these commands in terminal 
uv sync
uv run python ..\riverscapes_metadata\csv_to_layer_definitions.py --csv .\sample_layer_definitions_export.csv --authority-name test_authority  --tool-schema-version 0.0.1  --out .\layer_definitions.json

# You should see message: 
# Wrote unified layer definitions JSON: layer_definitions.json
# look for that file with current time stamp
# since the output is already in the repository, you can use git to see if content has changed
# This file can be used to test export_layer_definitions_for_s3.py