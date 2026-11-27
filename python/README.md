## Riverscapes Python Scripts

This directory contains assorted maintenance utilities for publishing Riverscapes XML assets, validating schemas, and running warehouse migrations.

### Working with uv

1. Install [uv](https://docs.astral.sh/uv/) if you have not already.
2. From this folder run `uv sync --group dev` the first time (or whenever dependencies change).
3. Execute tools with `uv run`, for example:
	- `uv run --project python validate.py`
	- `uv run --project python pytest python/test.py`
	- `uv run --project python flake8 .`

`uv sync` writes a `.venv` inside the project by default; add `UV_NO_SYNC=1` if you only need to update the lock file.

### Updating dependencies

- Add runtime libraries to `[project.dependencies]` in `pyproject.toml`.
- Add development-only tooling (linters, formatters, tests) under `[dependency-groups.dev]`.
- Run `uv lock` (or `uv sync`) to refresh `uv.lock` whenever dependencies are changed.

### Symbology modules

`Symbology/qgis/**/*.qml` is the QGIS source of truth; `Symbology/web/**/*.json` is generated from it.

| Module | Purpose |
|---|---|
| `QML2WebSymbology.py` | Converts a `.qml` file into the viewer's web symbology JSON. See `symbology_sync.md` for how the GitHub Action uses it. |
| `maplibre_expr.py` | A small MapLibre GL style-expression evaluator, used by the tests to work out which colour a feature actually renders as. Not used by the viewer. |

Edit the `.qml` and regenerate; never hand-edit a generated `Symbology/web` JSON, because `python/test.py` compares generated files against the converter's output.
