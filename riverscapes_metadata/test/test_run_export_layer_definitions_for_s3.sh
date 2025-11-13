# this is a "smoke test" for the export_layer_definitions_for_s3
# run these commands in terminal . make sure you are in the right path (\riverscapes_metadata\test)
uv sync
uv run python ..\riverscapes_metadata\export_layer_definitions_for_s3.py --root ./example_tool_folder

# You should see folder /dist/