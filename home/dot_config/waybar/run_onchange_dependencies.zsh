#!/usr/bin/env zsh
# Install mechabar dependencies
sudo pacman -S \
    bluez-utils \
    brightnessctl \
    pipewire \
    pipewire-pulse \
    ttf-jetbrains-mono-nerd \
    wireplumber

paru -S \
    bluetui \
    rofi-lbonn-wayland-git \
    spotifatius
