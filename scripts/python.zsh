#!/bin/zsh
export PIP_REQUIRE_VIRTUALENV=false

echo "Installing global python packages"
python3 -m pip install --upgrade pip

sudo python3 -m pip install --upgrade -r $DOTREPO/python/global_requirements.txt
sudo python3 -m pip install --upgrade --user -r $DOTREPO/python/user_requirements.txt

echo "Installing python virtualenv for neovim"
mkvirtualenv -p python3 -r $DOTREPO/python/venv_requirements.txt NeoVim3
mkvirtualenv -p python2 -r $DOTREPO/python/venv_requirements.txt NeoVim2
