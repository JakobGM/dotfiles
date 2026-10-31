#!/usr/bin/env bash
# Light/dark mode via the GNOME color-scheme setting, which xdg-desktop-portal-gtk
# broadcasts to kitty, ghostty, Firefox, GTK4 apps, etc.
#   theme-toggle.sh         print an icon for the current scheme on every change
#   theme-toggle.sh toggle  switch between light and dark
schema=org.gnome.desktop.interface

if [[ $1 == toggle ]]; then
  if [[ $(gsettings get $schema color-scheme) == "'prefer-light'" ]]; then
    gsettings set $schema color-scheme prefer-dark
    gsettings set $schema gtk-theme Adwaita-dark  # GTK3 ignores color-scheme
  else
    gsettings set $schema color-scheme prefer-light
    gsettings set $schema gtk-theme Adwaita
  fi
  exit
fi

{ gsettings get $schema color-scheme; gsettings monitor $schema color-scheme; } |
  while read -r line; do
    [[ $line == *prefer-light* ]] && echo "󰖨" || echo "󰖔"
  done
