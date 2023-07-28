# Fix issue with VSCode not getting access to the system keychain
# https://code.visualstudio.com/docs/editor/settings-sync#_troubleshooting-keychain-issues
export $(dbus-launch)

# See https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
# export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
# export SSH_AUTH_SOCK

# See https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME/.local/share/keyrings"

# See https://unix.stackexchange.com/a/690294
eval "$(echo '\n' | gnome-keyring-daemon --unlock)"
