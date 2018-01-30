#!/usr/bin/env zsh

if ! pgrep -f dropdown_terminal > /dev/null
then
    alacritty --title dropdown_terminal --dimensions 0 0
fi

if ! pgrep -f dropdown_ipython > /dev/null
then
    alacritty --title dropdown_ipython -e ipython --dimensions 0 0
fi
