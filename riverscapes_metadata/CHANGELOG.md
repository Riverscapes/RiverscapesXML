# Tool Changes

For **Schema changes** see CHANGELOG in schema folder

## Feb 2026

* Handling for 0.8 schema, new S3 paths allowing for two concurrent layer_definitions_schema versions and smooth transition between them.
* Expand search pattern for catalog files for anything matching "layer_definitions*.json", so not only `layer_definitions.json` but also for example  `layer_definitions_ver2.json`, `layer_definitions_part1`, `layer_definitions_part2`, etc.

## December 2025

* validation of units using Pint library prior to upload to S3/Athena
