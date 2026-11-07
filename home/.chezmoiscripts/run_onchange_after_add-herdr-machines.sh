#!/usr/bin/env bash
# Adds the own machines to herdr (`hc machine add`). herdr keeps its machines as
# state (~/.local/state/herdr-core/default/machines.json), not in a config file,
# so this list is the declarative one; chezmoi runs the script again whenever it
# changes. Machines herdr already has, and this machine itself, are skipped.
set -euo pipefail

# Tailscale names, which are also the ssh Hosts (~/.ssh/config) and herdr names
machines=(jakobgm-laptop jakobgm-home jakobgm-work)

if ! command -v hc >/dev/null || ! command -v tailscale >/dev/null; then
    echo "add-herdr-machines: hc or tailscale missing, skipping" >&2
    exit 0
fi

# Tailscale is the only place this machine's herdr name is known (hostnames
# differ, e.g. Jakobs-MBP). The work machine is remote-only: authorized_keys on
# the others gives its logins no shell, so herdr there cannot reach them.
self=$(tailscale status --peers=false 2>/dev/null | awk 'NR==1 { print $2 }') || exit 0
[[ $self == jakobgm-work ]] && exit 0

existing=$(hc machine ls --json)
for name in "${machines[@]}"; do
    [[ $name == "$self" ]] && continue
    grep -qF "\"name\":\"$name\"" <<<"$existing" && continue
    # --install copies this hc there when it has none or an older one.
    hc machine add "$name" --install >/dev/null ||
        echo "add-herdr-machines: could not add $name" >&2
done
