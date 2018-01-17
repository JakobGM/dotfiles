#!/usr/bin/env zsh

if [[ -v DOTREPO ]]
then
    cd $DOTREPO
    git submodule update --recursive
    mkvirtualenv -p python3.6 -a "$DOTREPO/archlinux/now_playing" i3
    workon i3

    # Dependency of now_playing
    pip install requests

    # Dependencies of i3scripts
    pip install i3ipc fontawesome
    sudo pacman -Syu xorg-xprop

    # Required by backgrounds.py script
    pip install astral

    deactivate
fi
