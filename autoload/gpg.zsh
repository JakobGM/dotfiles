# Fix issue with VSCode not getting access to the system keychain
# https://code.visualstudio.com/docs/editor/settings-sync#_troubleshooting-keychain-issues
# export $(dbus-launch)

# See https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
# gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg
# export SSH_AUTH_SOCK

# Use 1Password as the provider of the ssh-agent
# NB! Make sure to add the correct pam_gnome_kerying.so entries in /etc/pam.d/login
# pkill -f 'gnome-keyring-daemon'
export SSH_AUTH_SOCK=~/.1password/agent.sock

# See https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME/.local/share/keyrings"

# See https://unix.stackexchange.com/a/690294
# eval "$(echo '\n' | gnome-keyring-daemon --unlock)"
