#!/usr/bin/env zsh

if ! pgrep -f dropdown_terminal > /dev/null
then
    echo 'Starting dropdown terminal'
    kitty \
        --title dropdown_terminal \
        --name dropdown_terminal \
        --override initial_window_width=1920 \
        --override initial_window_height=1080 &
fi

if ! pgrep -f zeal > /dev/null
then
    echo 'Starting dropdown documentation browser'
    zeal &
fi

if ! pgrep -f dropdown_ipython > /dev/null
then
    echo 'Starting dropdown python REPL terminal'
    kitty \
        --title dropdown_ipython \
        --name dropdown_ipython \
        --override initial_window_width=1920 \
        --override initial_window_height=1080 \
        --directory $PROJECT_HOME/cloud \
        --instance-group ipython \
        $DOTREPO/archlinux/ipython.zsh &
fi
