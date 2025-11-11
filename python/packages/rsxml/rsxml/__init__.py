"""rsxml package root.

This file intentionally avoids importing heavy or dependency-requiring submodules
at import time so that build backends (setuptools reading the dynamic version)
can import ``rsxml`` before dependencies (e.g. ``requests``, ``lxml``) are
installed. Public symbols are made available lazily via ``__getattr__``.

Users can still do::

	from rsxml import Logger, fetch_xml

without triggering premature import failures during packaging.
"""

from __future__ import annotations
import importlib
from types import ModuleType
from typing import Any

from .__version__ import __version__  # PEP 621 dynamic version
from .constants import XSD_URL  # lightweight constant, safe to import eagerly
# Eagerly import only lightweight, dependency-free logging utilities so
# user code can rely on:  from rsxml import Logger, ProgressBar
from .logging.logger import Logger
from .logging.progress_bar import ProgressBar
# Heavy modules (network/XML parsing) remain lazy below.

__all__ = [
    '__version__', 'XSD_URL', 'Logger', 'ProgressBar'
]

_LAZY_MAP = {
    # Logger & ProgressBar are eagerly imported for convenience
    'fetch_xml': ('rsxml.validation', 'fetch_xml'),
    'validate_xml': ('rsxml.validation', 'validate_xml'),
    'validate_project_file': ('rsxml.validation', 'validate_project_file'),
    'calculate_etag': ('rsxml.etag', 'calculate_etag'),
    # For packages / modules expose the module object itself
    'project_xml': ('rsxml.project_xml', None),
    'debug': ('rsxml.debug', None),
}


def __getattr__(name: str) -> Any:
    target = _LAZY_MAP.get(name)
    if not target:
        raise AttributeError(f'module "rsxml" has no attribute {name!r}')
    module_name, attr = target
    mod: ModuleType = importlib.import_module(module_name)
    return getattr(mod, attr) if attr else mod


def __dir__():  # pragma: no cover - convenience only
    return sorted(list(globals().keys()) + list(_LAZY_MAP.keys()))
