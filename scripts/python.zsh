#!/bin/zsh
export PIP_REQUIRE_VIRTUALENV=false

echo "Installing global python packages"
python3 -m pip install --upgrade pip

python3 -m pip install --upgrade -r $DOTREPO/python/global_requirements.txt
python3 -m pip install --upgrade --user -r $DOTREPO/python/user_requirements.txt
