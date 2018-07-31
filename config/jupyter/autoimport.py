import os
import sys
from pathlib import Path

try:
    from django.contrib.gis.geos import (
        Point,
        Polygon,
        LineString,
    )
except ImportError:
    pass
