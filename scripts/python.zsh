#!/bin/zsh
export PIP_REQUIRE_VIRTUALENV=false

echo "Installing global python packages"
python3 -m pip install --upgrade pip
python3 -m pip install --quiet --upgrade --user -r $DOTREPO/python/global_requirements.txt
