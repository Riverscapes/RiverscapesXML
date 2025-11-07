# Layer Definitions

This folder contains artifacts to support a consistent metadata handling in Riverscapes tools. Any model or script that generates data can use this to help define the layers (tables, views, vector and raster gis layers) and their attributes (columns or bands). By following the specification defined here, consumers of the data (humans or other tools) will know exactly what they are getting.

## Contents

### Json schema

This schema is published to xml.riverscapes.net and defines the information, required and optional, to include in the layer_definitions

### python \ export_layer_definitions_for_s3

`export_layer_definitions_for_s3.py` 
Currently this is in the data-exchange-scripts repo. Maybe we will move it here later.

### python \ csv_to_layer_definitions

This is a utility to convert a csv file into a compliant JSON. The [google sheet layer_definitions template](https://docs.google.com/spreadsheets/d/1kmcAwVS9PcPpiqJEulhSmZG9wIR11vgikw__JanYt90/edit?usp=sharing) can be copied and used to export such a csv. 

This is intended for one time use, not as an ongoing pipeline.

## Athena External Table

We publish to: `s3://riverscapes-athena/metadata/layer_definitions/`

Recommended external table DDL (Parquet, partition columns excluded from file content):

```sql
CREATE EXTERNAL TABLE IF NOT EXISTS layer_definitions (
  layer_id          string  COMMENT 'Stable identifier of the layer or table, for example used for project.rs.xml id',
  layer_name        string  COMMENT 'Human-readable layer or table name (may match layer_id)',
  layer_type        string  COMMENT 'Layer category (table, view, raster, vector)',
  layer_description string  COMMENT 'Human-readable summary of the layer',
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
COMMENT 'Unified Riverscapes layer column definitions (structural + descriptive metadata)'
PARTITIONED BY (
  authority          string COMMENT 'Repository root name (publishing authority)',
  authority_name     string COMMENT 'Issuing package/tool authority name',
  tool_schema_version string COMMENT 'Tool schema version (semver)'
)
STORED AS PARQUET
LOCATION 's3://riverscapes-athena/metadata/layer_definitions/';
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
LOCATION 's3://riverscapes-athena/metadata/layer_definitions/authority=data-exchange-scripts/authority_name=rme_to_athena/tool_schema_version=1.0.0/';
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
