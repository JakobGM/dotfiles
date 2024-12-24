#!/bin/sh

current_map=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')
if [ $current_map = "dvp" ]
then
  setxkbmap no
else
  # Set programmer-dvorak as the keyboard layout
  setxkbmap dvp
fi

# Swap caps lock and escape key
setxkbmap -option caps:swapescape

# Enable the use of {left|right}AltGr+aoe to write åøæ
setxkbmap -option lv3:ralt_switch 
setxkbmap -option lv3:lalt_switch 

# Key repeat delay / rate in ms
xset r rate 200 25
