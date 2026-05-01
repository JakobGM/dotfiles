#!/usr/bin/env zsh
# Render the theme into ~/.config/kitty/current-theme.conf, which kitty.conf
# already includes. Using --dump-theme avoids the kitten's default behavior of
# mutating kitty.conf in-place.
command -v kitten >/dev/null || exit 0
kitten themes --dump-theme 'Gruvbox Dark Soft' > "${HOME}/.config/kitty/current-theme.conf"
