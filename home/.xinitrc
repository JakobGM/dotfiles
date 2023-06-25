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

# Fix issue with VSCode not getting access to the system keychain
# https://code.visualstudio.com/docs/editor/settings-sync#_troubleshooting-keychain-issues
export $(dbus-launch)

# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# See https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export SSH_AUTH_SOCK

# See https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME/.local/share/keyrings"

# See https://unix.stackexchange.com/a/690294
eval "$(echo '\n' | gnome-keyring-daemon --unlock)"

# Start the Xorg instance, with i3 as the TWM
exec i3
