#!/usr/bin/env zsh

if ! pgrep -f dropdown_terminal > /dev/null
then
    echo 'Starting dropdown terminal'
    kitty \
        --title dropdown_terminal \
        --name dropdown_terminal \
        --override initial_window_width=1600 \
        --override initial_window_height=720 &
fi

if ! pgrep -f devdocs-desktop > /dev/null
then
    echo 'Starting dropdown documentation browser'
    devdocs-desktop &
fi

if ! pgrep -f dropdown_ipython > /dev/null
then
    echo 'Starting dropdown python REPL terminal'
    kitty \
        --title dropdown_ipython \
        --name dropdown_ipython \
        --override initial_window_width=1600 \
        --override initial_window_height=720 \
        --directory $PROJECT_HOME/sunmapper \
        --instance-group ipython \
        --hold \
        -o allow_remote_control=yes \
        --listen-on unix:/tmp/kitty_python \
        $DOTREPO/archlinux/ipython.zsh &
fi
