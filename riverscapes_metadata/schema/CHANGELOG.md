# Layer Definitions Schema changes

## 0.8.0

* adds `preferred_format` for columns
* adds `dtype_parameters` for additional specifications about the data type e.g. {"precision": 10, "scale": 2}  for DECIMAL or {"srid": 4326} for GEOMETRY or {"structure": "map", "key": "STRING", "value": "FLOAT"} for STRUCTURED

### Breaking changes

* `authority_name` is now renamed `tool_schema_name`. A python script to crawl and remediate existing layer_definitions is found in non-core_helpers `migrate_authority_name.py` 
* `dtype` is now an enum of **logical** data types. Producing and consuming applications should be able to translate these to physical data types, especially when combined with `is_required`

## 0.7.1 December 2025

* This version used in Data Exchange scripts, published to Athena and used in reports.riverscapes.net in production
* Added new `layers/source_title` attribute
* Improved descriptions including clarification of Units

## 0.6.1 November 2025

* published and working