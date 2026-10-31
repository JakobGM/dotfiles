#!/usr/bin/env zsh
# Render kitty's auto-theme files, which kitty switches between automatically
# when the system color scheme changes (toggled from waybar).
# Pick any name from `kitten themes`; set both to the same theme to always use it.
dark_theme='Gruvbox Dark Soft'
light_theme='Gruvbox Light Soft'

command -v kitten >/dev/null || exit 0
dir="${HOME}/.config/kitty"
kitten themes --dump-theme "${dark_theme}" > "${dir}/dark-theme.auto.conf"
kitten themes --dump-theme "${dark_theme}" > "${dir}/no-preference-theme.auto.conf"
kitten themes --dump-theme "${light_theme}" > "${dir}/light-theme.auto.conf"
