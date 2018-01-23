#!/usr/bin/env zsh
# Add user to input group for access to input devices, since X11 is started in rootless mode
sudo gpasswd -a $USER input 

sudo ln -fs "$XDG_CONFIG_HOME/X11/70-synaptics.conf" /etc/X11/xorg.conf.d
