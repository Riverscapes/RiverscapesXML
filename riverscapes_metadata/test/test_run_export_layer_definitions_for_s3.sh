# this is a "smoke test" for the export_layer_definitions_for_s3 and publish_metadata
# run these commands in terminal . make sure you are in the right path (\riverscapes_metadata\)
uv sync
uv run python ./riverscapes_metadata/export_layer_definitions_for_s3.py --root ./test/example_tool_folder
uv run python ./riverscapes_metadata/publish_metadata.py --root ./test/example_tool_folder

# You should see folder /dist/ created and populated