#!/usr/bin/env zsh
source ~/.config/zsh/.zshrc
cd ~/crdbrd/hub
clear
source .venv/bin/activate
poetry run python -m hub.manage shell_plus
