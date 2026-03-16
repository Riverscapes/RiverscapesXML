#! /bin/bash
set -eu

# On OSX you must have run `brew install gdal` so that the header files are findable 
if ! command -v uv >/dev/null 2>&1; then
  echo "uv is required. Install it from https://docs.astral.sh/uv/." >&2
  exit 1
fi

ROOT_DIR=$(cd "$(dirname "$0")/.." && pwd)

pushd "$ROOT_DIR/python" >/dev/null
uv sync --group dev
popd >/dev/null

echo "uv environment ready in python/.venv"
