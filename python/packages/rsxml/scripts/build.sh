#!/usr/bin/env bash
set -euo pipefail

echo "==> Building rsxml with uv"

if ! command -v uv >/dev/null 2>&1; then
	echo "uv not found on PATH. Installing locally via pip (user)." >&2
	python -m pip install --user uv
fi

# Clean previous build artifacts
rm -rf dist build *.egg-info || true

# Build (creates sdist and wheel under dist/)
uv build

echo "==> Build artifacts:"
ls -1 dist || true

echo "Run 'uv publish --token $PYPI_TOKEN' or use scripts/deploy.sh to upload."