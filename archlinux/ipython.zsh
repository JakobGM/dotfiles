#!/usr/bin/env zsh
source ~/.config/zsh/.zshrc
cd ~/vibako/hub
clear
source .venv/bin/activate
poetry run python -m hub.manage shell_plus
