#!/usr/bin/env zsh

if ! pgrep -f dropdown_terminal > /dev/null
then
    # alacritty --title dropdown_terminal --dimensions 0 0
    kitty --title dropdown_terminal --name dropdown_terminal
fi

if ! pgrep -f dropdown_ipython > /dev/null
then
    # alacritty --dimensions 0 0 --title dropdown_ipython -e ipython
    kitty --title dropdown_ipython --name dropdown_ipython --directory $WORKON_HOME/astrality ipython
fi

if ! pgrep -f zeal > /dev/null
then
    zeal
fi

# Try to start dropdown_ipython again if it panics on startup (for some reason)
if ! pgrep -f dropdown_ipython > /dev/null
then
    kitty --title dropdown_ipython --name dropdown_ipython --directory $WORKON_HOME/astrality ipython
    # alacritty --dimensions 0 0 --title dropdown_ipython -e ipython
fi
