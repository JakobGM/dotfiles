# JakobGM's dotfiles

These are my [chezmoi](https://www.chezmoi.io/)-managed dotfiles.

> [!NOTE]
> If you're not familiar with chezmoi, you should know about its somewhat quirky [filename conventions](https://www.chezmoi.io/reference/source-state-attributes/):
> * Files and directories in the `home/` directory of this repository are placed into the home directory upon `chezmoi apply`.
> * `dot_` prefixes in filenames are replaced with `.`.
> * Files with `.tmpl` suffixes are [rendered as templates](https://www.chezmoi.io/user-guide/templating/).
>
> E.g. `home/dot_config/wakatime/private_dot_wakatime.cfg.tmpl` is rendered to `~/.config/wakatime/.wakatime.cfg`.

My setup has the following scopes:

* **Multiple hosts**: a low-specced mDPI laptop, headless servers, and desktops with both Nvidia and AMD GPUs. 
* One operating system: Linux, specifically the **Arch Linux** distribution.
* Wayland-based tiling window manager: **Sway**.
* Terminal-based workflows: using **Kitty** and **fish**, with **Atuin** for shell history.
* Modal editing: using **Neovim** with the **lazy.nvim** package manager and a **lua**-based configuration.
* **Python** as the programming language of choice.

## Getting started

Provided that you already have `chezmoi` installed, run the following:

```sh
chezmoi init git@github.com:JakobGM/dotfiles.git
chezmoi apply
```

## Shell

fish is the login shell. Environment variables live in `home/dot_config/fish/conf.d/00-env.fish.tmpl`,
so they reach sway and GUI programs too. Interactive setup is in `config.fish`.
zsh stays installed only for the `*.zsh` scripts.

Shell history is in [Atuin](https://atuin.sh), synced end-to-end encrypted to `api.atuin.sh`.
The account was created once with `atuin register -u <user> -e <email>`;
the password and the encryption key (`atuin key`) are stored in 1Password,
and `atuin login` asks for both on every other machine.

### Migrating a machine from zsh

`chezmoi apply` backs up the zsh history to `~/.local/share/zsh/history.pre-fish`,
installs fish/starship/zoxide/atuin (pacman or Brewfile), removes the old zsh config,
makes fish the login shell and imports `~/.z` into zoxide. Log out and back in right after.
Until then, the session still exports the old zsh variables; `~/.config/zsh/.zshenv`
stays behind as a guard so that a new zsh cannot rewrite the history without timestamps.
Do not `exit` zsh shells that were started before the apply; close their windows instead.

Importing the old zsh history is manual, because it may contain secrets.
Log in first, so that the import is encrypted with the account's key:

```sh
atuin login
cd ~/.local/share/zsh
zsh-history-scrub scan history.pre-fish | less   # review what gets dropped
zsh-history-scrub write history.pre-fish /tmp/zsh-history.cleaned
HISTFILE=/tmp/zsh-history.cleaned atuin import zsh
rm /tmp/zsh-history.cleaned
atuin sync && atuin status    # check that the history was uploaded
rm history history.pre-fish   # only then; both hold the secrets the scrub dropped
```

Never run `atuin import auto` or `atuin import zsh` against the original file,
since that would import the dropped entries.

Rotate any credential the scan finds; dropping it from history does not un-leak it.

## SSH

SSH keys live in 1Password and are served by its SSH agent; private keys never touch disk.

* **Client**: `~/.ssh/config` points `IdentityAgent` at the 1Password agent.
  Add short aliases as `Host` entries in `home/private_dot_ssh/config.tmpl`.
  Verify a machine with `mise run ssh:client`.
* **Inside an SSH session** (`SSH_CONNECTION` set), SSH and git commit signing use the forwarded
  agent instead of the remote 1Password, so 1Password asks on the machine you connect from.
  Own hosts have `ForwardAgent yes`; signing goes through `~/.local/bin/git-ssh-sign`.
* **Secrets**: write them inline in any template as
  `{{ onepasswordRead "op://vault/item/field" "<account>" }}`; nothing else needs editing.
  chezmoi runs `op` through `~/.local/bin/op-forwarded`. On a cache miss it reads every literal
  `onepasswordRead` reference in the chezmoi source in one process (one 1Password prompt per
  account) and caches the values for 12 hours; `op-forwarded --clear` drops the cache after a
  secret changes in 1Password. A reference must not occur in both accounts (use IDs, not names).
  Inside an SSH session the values come from the machine you connected from
  (`ssh <it> op-forwarded --serve`, only if `tailscale whois` shows it is yours), which serves
  the references in **its own** chezmoi source, so pull your dotfiles there after adding one.
* **Server**: `~/.ssh/authorized_keys` allows only the 1Password "Main SSH key". Logins from
  remote-only machines (oxygen) may only run `op-forwarded --serve`, so code there that uses the
  forwarded agent gets no shell on your other machines (and `ssh gold` from oxygen is refused).
  Run `mise run ssh:server` once per machine to disable password logins, allow only `jakobgm`,
  enable `sshd` and, on Linux, allow port 22 in ufw on `tailscale0` only
  (opt-in, since it changes system state). Hosts: `silver` (laptop), `gold` (home), `oxygen` (work).
