#!/usr/bin/env zsh
source ~/.config/zsh/.zshrc
cd ~/vibako/hub
clear
poetry run python ~/vibako/hub/src/hub/manage.py shell_plus
