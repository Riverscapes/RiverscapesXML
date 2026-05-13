# qgis.xsd — How It Was Made

## Overview

`qgis.xsd` is an XML Schema Definition (XSD) that describes the structure of QGIS Layer Style (`.qml`) files. It was automatically inferred by running **Trang** against all 951 `.qml` files found in the `Symbology/qgis/` directory tree.

The schema is used to validate QGIS symbology files in this repository and to provide editor tooling (autocomplete, hover documentation, inline error checking) when working with `.qml` files.

---

## What is Trang?

[Trang](https://relaxng.org/jclark/trang.html) is a multi-format schema conversion/inference tool written by James Clark. It can:
- Infer a schema from one or more XML instance documents
- Convert between schema formats (RelaxNG, DTD, XSD, etc.)

Trang is distributed as a single runnable JAR file. It requires Java 8+.

**Download:** https://relaxng.org/jclark/trang.html  
(Direct link to jar: `https://github.com/relaxng/jing-trang/releases` — look for `trang.jar` in the latest release.)

A copy used during generation was located at `/tmp/trang.jar` (Trang version `20091111`).

---

## Source Material

The schema was inferred from all `.qml` files in the repository under:

```
Symbology/qgis/
```

This directory contains **951 `.qml` files** organised across 35 sub-folders representing different Riverscapes tools and programs:

| Folder | Description |
|---|---|
| `Anthro/` | Anthropogenic context layers |
| `BLMContext/` | BLM context |
| `BRAT/`, `Riverscapes_BRAT/`, `pyBRAT/` | Beaver Restoration Assessment Tool |
| `Beaver_Activity/` | Beaver activity monitoring |
| `CHaMPMetrics/` | CHaMP metrics |
| `ChannelArea/` | Channel area mapping |
| `Confinement/` | Valley confinement |
| `GRTS/` | GRTS master sample |
| `GUT/` | Geomorphic Unit Tool |
| `Grazing/` | Grazing impact layers |
| `Hydro/`, `hydro_context/` | Hydrology |
| `Inundation/` | Inundation mapping |
| `ItalyNational/`, `NZNational/`, `RSContextNZ/` | National/regional contexts |
| `LTPBRDesign/` | Low-tech PBR design |
| `NZGEMS/` | New Zealand GEMS |
| `PBR/`, `QRiS/` | Process-based restoration |
| `QRF/` | Quantitative risk framework |
| `RCA/`, `RCAT/` | Riparian condition/assessment |
| `RSContext/` | Riverscapes context |
| `RSDynamics/` | Riverscapes dynamics |
| `RVD/` | Riparian vegetation departure |
| `RiverscapesStudio/` | Riverscapes Studio layers |
| `Shared/` | Shared/common symbology |
| `TauDEM/` | TauDEM hydrology |
| `Topo/` | Topographic layers |
| `VBET/` | Valley Bottom Extraction Tool |
| `landscape_synthesis/` | Landscape synthesis |
| `pibo_riverscapes/` | PIBO Riverscapes |

By feeding Trang the full corpus of QML files, the schema covers the widest possible range of QGIS layer types, renderer types, labelling configurations, and raster pipeline elements actually used in production.

---

## Step-by-Step: Regenerating the XSD

### Prerequisites

- Java 8 or later installed (`java -version`)
- `trang.jar` downloaded (see above)
- Run all commands from the **repository root** (`RiverscapesXML/`)

### Step 1 — Download Trang

```bash
curl -L -o /tmp/trang.jar \
  https://github.com/relaxng/jing-trang/releases/download/V20220510/trang.jar
```

> **Note:** The version used when this XSD was originally generated was `20091111`. Later versions (e.g. `20220510`) produce functionally equivalent output. If exact reproducibility matters, obtain the matching version.

### Step 2 — Collect all QML file paths

Verify the files are present:

```bash
find Symbology/qgis -name "*.qml" | wc -l
# Expected: ~951
```

### Step 3 — Run Trang

Trang accepts all input files as positional arguments, with the last argument being the output file:

```bash
java -jar /tmp/trang.jar \
  $(find Symbology/qgis -name "*.qml" | sort | tr '\n' ' ') \
  Symbology/qgis.xsd
```

> **Shell argument limits:** On macOS/Linux the default `ARG_MAX` is typically 256 KB or more. With ~951 files at an average path length of ~60 characters (~57 KB total), this comfortably fits within the limit. If you ever encounter `Argument list too long`, use the script approach below.

#### Alternative: script approach (avoids argument limits)

```python
#!/usr/bin/env python3
"""generate_qgis_xsd.py — Run Trang over all QML files to regenerate qgis.xsd"""
import subprocess
import glob
import os

TRANG_JAR = "/tmp/trang.jar"
OUTPUT_XSD = "Symbology/qgis.xsd"

qml_files = sorted(glob.glob("Symbology/qgis/**/*.qml", recursive=True))
print(f"Found {len(qml_files)} QML files")

cmd = ["java", "-jar", TRANG_JAR] + qml_files + [OUTPUT_XSD]
result = subprocess.run(cmd, capture_output=True, text=True)

if result.returncode != 0:
    print("STDERR:", result.stderr)
    raise SystemExit(result.returncode)

print(f"Schema written to {OUTPUT_XSD}")
```

Run from the repository root:

```bash
python3 generate_qgis_xsd.py
```

### Step 4 — Add the generation comment

Trang does not add any preamble comment. After generation, the first line after the XML declaration should be updated to note that the file is auto-generated. The current header is:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!-- NOTE: THIS XSD WAS GENERATED AUTOMATICALLY USING TRANG -->
```

Add this comment if it is missing after regeneration:

```bash
# Insert the comment after the XML declaration (macOS/BSD sed):
sed -i '' '1a\
<!-- NOTE: THIS XSD WAS GENERATED AUTOMATICALLY USING TRANG -->
' Symbology/qgis.xsd
```

---

## Schema Design Notes

### How Trang infers the schema

Trang analyses every element, attribute, text node, and their relationships across **all** supplied instance documents and produces the most permissive XSD that validates all of them. Key behaviours:

- **`minOccurs="0"`** — applied to any element that is absent in at least one input document.
- **`maxOccurs="unbounded"`** — applied to any element that appears more than once in any input document.
- **`use="required"`** on attributes — only when the attribute appears in **every** instance of that element.
- Type inference (`xs:integer`, `xs:decimal`, `xs:boolean`, `xs:NCName`, `xs:anyURI`) — Trang makes conservative type assignments; some are left as untyped (`xs:string` or no type annotation) when values are mixed.

### Key elements in the schema

| Element | Purpose |
|---|---|
| `<qgis>` | Root element. Holds all layer style information. |
| `<renderer-v2>` | Vector renderer. `type` attribute distinguishes `singleSymbol`, `categorizedSymbol`, `graduatedSymbol`, `RuleRenderer`, etc. |
| `<categories>` / `<ranges>` / `<rules>` | Classification data for categorised, graduated, and rule-based renderers. |
| `<symbol>` | A QGIS symbol definition. Contains one or more `<layer>` elements. |
| `<layer>` | A symbol layer. `class` attribute names the symbol layer type (e.g. `SimpleLine`, `SimpleFill`, `SvgMarker`). |
| `<prop>` | Key/value property pair on a symbol layer (`k` + `v` attributes). |
| `<Option>` | Recursive key/value/type node used throughout for flexible property bags. |
| `<colorramp>` | A colour ramp definition (gradient, random, preset, etc.). |
| `<pipe>` | Raster rendering pipeline: `<rasterrenderer>`, `<brightnesscontrast>`, `<huesaturation>`, `<rasterresampler>`. |
| `<labeling>` | Label configuration. Contains `<settings>` with `<text-style>`, `<placement>`, `<rendering>`. |
| `<elevation>` | 3D/elevation profile symbology. |
| `<temporal>` | Temporal filtering configuration. |
| `<customproperties>` | Arbitrary key/value store attached to a layer. |
| `<DiagramCategory>`, `<LinearlyInterpolatedDiagramRenderer>`, `<SingleCategoryDiagramRenderer>` | QGIS diagram rendering (pie charts, bar charts, etc.). |

### Known limitations of the generated schema

Because the schema is inferred rather than hand-authored, it has several expected limitations:

1. **`xs:choice` is overused.** Where QGIS actually uses strict ordering, Trang sometimes emits `xs:choice` because not every file contains every optional child. This makes the schema more permissive than the real QGIS format.

2. **Attribute types are conservative.** Many attributes that QGIS treats as enumerated values (e.g. `type`, `mode`) are typed as `xs:NCName` or left untyped because Trang cannot infer enumerations.

3. **The `<Option>` element is fully recursive** — this accurately reflects QGIS's own design but means the schema cannot constrain the content of `Option` trees.

4. **The schema does not cover every possible QGIS version.** It reflects the union of all QML files present in the repository at the time of generation. New QGIS versions may introduce elements or attributes not yet represented.

5. **`<qgis>` child ordering is loose.** The main body of `<qgis>` uses a broad `xs:choice maxOccurs="unbounded"` block because different layer types (vector, raster) use mutually exclusive child elements. A hand-authored schema would split this into separate complex types.

---

## When to Regenerate

Regenerate `qgis.xsd` when:

- New `.qml` files are added to `Symbology/qgis/` that use QGIS features not yet covered by the schema (e.g. after a QGIS version upgrade introduces new renderer types or properties).
- Validation errors appear for valid `.qml` files, suggesting missing elements or attributes.

After regeneration, review the diff carefully — large structural changes may indicate a QML file with unusual content that skews the inferred schema.

---

## Related Files

| Path | Description |
|---|---|
| `Symbology/qgis.xsd` | The generated XSD (this file's companion) |
| `Symbology/qgis/` | Source `.qml` files used to generate the schema |
| `Symbology/arcpro/` | ArcGIS Pro symbology (`.lyrx`) — separate schema |
| `Symbology/esri/` | ESRI symbology |
| `Symbology/web/` | Web symbology |
