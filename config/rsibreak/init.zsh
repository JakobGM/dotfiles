#!/usr/bin/env zsh

killall rsibreak
sleep 2
rsibreak --desktopfile $XDG_CONFIG_HOME/rsibreak/rsibreak
