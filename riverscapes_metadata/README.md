# Layer Definitions

This folder contains artifacts to support a consistent metadata handling in Riverscapes tools. Any model or script that generates data can use this to help define the layers (tables, views, vector and raster gis layers) and their attributes (columns or bands). By following the specification defined here, consumers of the data (humans or other tools) will know exactly what they are getting.

## Contents

### Json schema

This schema is published to xml.riverscapes.net and defines the information, required and optional, to include in the layer_definitions. Layer metadata now includes:

- `path`: relative or absolute location of the layer delivery artifact (S3 key, repo path, etc.).
- `theme`: optional higher-level grouping for the layer itself (distinct from column `theme`).
- Expanded `layer_type` options aligned with RiverscapesProject.xsd `DataSetContainerType` (e.g., `Raster`, `Vector`, `Geopackage`).
- Optional provenance fields (`source_title`, `source_url`, `data_product_version`).

### riverscapes_metadata \ export_layer_definitions_for_s3

`export_layer_definitions_for_s3.py`

This is exported for use in other repositories to go flatten `layer_definition.json` into a parquet files (partitioned by repository/tool/tool-schema-version) that serve as source for Athena table (see below).

### riverscapes_metadata \ csv_to_layer_definitions

This is a utility to convert a csv file into a compliant JSON. The [google sheet layer_definitions template](https://docs.google.com/spreadsheets/d/1kmcAwVS9PcPpiqJEulhSmZG9wIR11vgikw__JanYt90/edit?usp=sharing) can be copied and used to export such a csv.

This is intended for one time use, not as an ongoing pipeline.

Sample input and output are in the `test` folder.

## Athena External Table

We publish to: `s3://riverscapes-athena/riverscapes_metadata/layer_definitions/`

Recommended external table DDL (Parquet, partition columns excluded from file content):

```sql
CREATE EXTERNAL TABLE IF NOT EXISTS layer_definitions (
  layer_id                  string  COMMENT 'Stable identifier of the layer or table, for example used for project.rs.xml id',
  layer_name                string  COMMENT 'Human-readable layer or table name (may match layer_id)',
  layer_type                string  COMMENT 'Layer category (CommonDatasetRef, Raster, Vector, Geopackage, etc.)',
  layer_path                string  COMMENT 'Relative or absolute path to the delivered layer artifact',
  layer_theme               string  COMMENT 'High level grouping for the layer (e.g., Hydrology, Vegetation)',
  layer_source_title        string  COMMENT 'External provenance or documentation title'
  layer_source_url          string  COMMENT 'Provenance or documentation URL for the layer',
  layer_data_product_version string COMMENT 'Data vintage/year or version string',
  layer_description         string  COMMENT 'Human-readable summary of the layer',
  column_index      int     COMMENT 'Order of column in the definition',
  name              string  COMMENT 'Column (or raster band) identifier',
  friendly_name     string  COMMENT 'Display-friendly name for the column',
  theme             string  COMMENT 'Grouping theme -- useful for very wide tables (e.g., Beaver, Hydrology)',
  data_unit         string  COMMENT 'Pint-compatible unit string (e.g., m, km^2, %)',
  dtype             string  COMMENT 'Data type (INTEGER, REAL, TEXT, etc.)',
  description       string  COMMENT 'Detailed description of the column',
  is_key            boolean COMMENT 'Participates in a primary/unique key',
  is_required       boolean COMMENT 'True if field cannot be empty. Corresponds to SQL NOT NULL',
  default_value     string  COMMENT 'Default value for new records',
  commit_sha        string  COMMENT 'git commit at time of harvest from authority json'
)
COMMENT 'Unified Riverscapes layer column definitions (structural + descriptive metadata).'
PARTITIONED BY (
  authority          string COMMENT 'Repository root name (publishing authority)',
  authority_name     string COMMENT 'Issuing package/tool authority name',
  tool_schema_version string COMMENT 'Tool schema version (semver)'
)
STORED AS PARQUET
LOCATION 's3://riverscapes-athena/riverscapes_metadata/layer_definitions/';
```

Add new partitions (after upload):

```sql
-- auto-discover
MSCK REPAIR TABLE layer_definitions;  
-- OR manual:
ALTER TABLE layer_definitions
ADD IF NOT EXISTS PARTITION (
  authority='data-exchange-scripts',
  authority_name='rme_to_athena',
  tool_schema_version='1.0.0'
)
LOCATION 's3://riverscapes-athena/riverscapes_metadata/layer_definitions/authority=data-exchange-scripts/authority_name=rme_to_athena/tool_schema_version=1.0.0/';
```

### Example Queries

List column definitions for a tool version:

```sql
SELECT name, friendly_name, dtype, description
FROM layer_definitions
WHERE authority='data-exchange-scripts'
  AND authority_name='rme_to_athena'
  AND tool_schema_version='1.0.1'
ORDER BY name;
```

Count columns by dtype across all authorities:

```sql
SELECT dtype, COUNT(*) AS n
FROM layer_definitions
GROUP BY dtype
ORDER BY n DESC;
```

Compare two versions of a tool:

```sql
SELECT a.name,
       a.dtype AS dtype_v1,
       b.dtype AS dtype_v2
FROM layer_definitions a
JOIN layer_definitions b
  ON a.authority = b.authority
 AND a.authority_name = b.authority_name
 AND a.name = b.name
WHERE a.authority='data-exchange-scripts'
  AND a.authority_name='rme_to_athena'
  AND a.tool_schema_version='1.0.0'
  AND b.tool_schema_version='1.1.0';
```
