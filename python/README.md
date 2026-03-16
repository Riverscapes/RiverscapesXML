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
