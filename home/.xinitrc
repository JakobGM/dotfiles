#!/bin/sh

userresources=$XDG_CONFIG_HOME/X11/Xresources
usermodmap=$XDG_CONFIG_HOME/X11/Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Set programmer-dvorak as the keyboard layout
setxkbmap dvp

# Swap caps lock and escape key
setxkbmap -option caps:swapescape

# Enable the use of {left|right}AltGr+aoe to write åøæ
setxkbmap -option lv3:ralt_switch 
setxkbmap -option lv3:lalt_switch 

# Key repeat delay / rate in ms
xset r rate 200 25

# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# Start the Xorg instance, with i3 as the TWM
exec i3
