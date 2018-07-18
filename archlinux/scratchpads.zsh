#!/usr/bin/env zsh

if ! pgrep -f dropdown_terminal > /dev/null
then
    # alacritty --title dropdown_terminal --dimensions 0 0
    kitty --title dropdown_terminal --name dropdown_terminal
fi

while ! pgrep -f dropdown_ipython > /dev/null
do
    kitty \
        --title dropdown_ipython \
        --name dropdown_ipython \
        --directory $PROJECT_HOME/cloud \
        --instance-group ipython \
        $DOTREPO/archlinux/ipython.zsh
    sleep 5
done

if ! pgrep -f zeal > /dev/null
then
    zeal
fi
