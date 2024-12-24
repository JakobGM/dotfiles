#!/bin/env zsh
# Configuration for everything R-Lang related
# See: https://stat.ethz.ch/R-manual/R-devel/library/base/html/EnvVar.html

# Web browser used by R
export R_BROWSER=$BROWSER

# Enable completion
export R_COMPLETION=1

# Path to default PDF viewer
export R_PDFVIEWER=$(which okular)

# The current time zone
export TZ='Europe/Oslo'
