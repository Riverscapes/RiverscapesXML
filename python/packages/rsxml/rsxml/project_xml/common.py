"""Mostly common types and constants for the rsxml package.
"""

from __future__ import annotations
from typing import Dict, NamedTuple


class Coords(NamedTuple):
    lng: float
    lat: float


class BoundingBox(NamedTuple):
    minLng: float
    minLat: float
    maxLng: float
    maxLat: float


class GeoPackageDatasetTypes:
    """_summary_
    """
    RASTER = 'Raster'
    VECTOR = 'Vector'
    DATATABLE = 'DataTable'
