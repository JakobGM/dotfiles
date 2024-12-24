#!/usr/bin/zsh

sudo mount /dev/sdc2 /boot/efi

local REFIND_DOTFILES="$XDG_CONFIG_HOME/refind"
local REFIND_TARGET='/boot/efi/EFI/refind'

# Backup
sudo mv $REFIND_TARGET/refind.conf $REFIND_TARGET/refind.conf.bak

# Copy over files
sudo cp  $REFIND_DOTFILES/refind.conf $REFIND_TARGET
sudo cp -r $REFIND_DOTFILES/themes $REFIND_TARGET
