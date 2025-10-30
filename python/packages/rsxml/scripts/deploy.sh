#!/usr/bin/env bash
set -euo pipefail

if ! command -v uv >/dev/null 2>&1; then
	echo "uv not found on PATH. Installing locally via pip (user)." >&2
	python -m pip install --user uv
fi

if [[ -z "${PYPI_TOKEN:-}" ]]; then
	echo "PYPI_TOKEN environment variable not set. Aborting." >&2
	exit 1
fi

echo "==> Publishing rsxml to PyPI with uv"
uv publish --token "$PYPI_TOKEN" "$@"

echo "==> Publish complete"