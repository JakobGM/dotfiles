#!/usr/bin/env zsh

if [[ -v DOTREPO ]]
then
    cd $DOTREPO
    git submodule update --recursive
    mkvirtualenv -p python3.6 -a "$DOTREPO/archlinux/now_playing" now_playing
    pip install requests
fi
