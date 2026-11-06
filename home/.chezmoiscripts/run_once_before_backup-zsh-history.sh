#!/usr/bin/env bash
# Copy the zsh history aside before chezmoi removes the zsh config. The copy
# is never overwritten, and it keeps the timestamps for `atuin import`; see
# run_once_after_migrate-to-fish.sh.tmpl and dot_config/zsh/dot_zshenv.
set -euo pipefail
history="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
backup="$history.pre-fish"
if [[ -s "$history" && ! -e "$backup" ]]; then
    cp -p "$history" "$backup"
    chmod 600 "$backup"
    echo "backup-zsh-history: copied $history to $backup"
    # Every entry of an EXTENDED_HISTORY file starts with `: <time>:<duration>;`
    if ! grep -q '^: [0-9]*:[0-9]*;' "$backup"; then
        echo "backup-zsh-history: WARNING: $backup has no timestamps; it was" \
            "already rewritten by a zsh without the old config" >&2
    fi
fi
