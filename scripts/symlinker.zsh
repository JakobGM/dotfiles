#!/bin/zsh

echo "\nSymlinking all dotfiles\n"

# Glob hidden files
setopt glob_dots

# Symlink all home directory dotfiles
ln -svf $DOTREPO/home/* $HOME

echo
# This only matches when there exists a symlink already, which also
# points to the correct folder in the dotfile repo. NB! Not POSIX compliant
# See: https://unix.stackexchange.com/questions/192294/
if [ "$HOME/.config" -ef "$DOTREPO/config" ]
then
    echo ".config is already symlinked to dotfiles repo"
else
    echo "\$HOME/.config has not been symlinked to $DOTREPO/config"

    # Confirm if we want to symlink
    read -q "REPLY?Symlink now (y/n)?: "
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        # Keep backup of old $HOME/.config
        mv $HOME/.config $HOME/.config.old

        # Symlink .config to dotrepo, as not all applications respect $XDG_CONFIG_HOME
        ln -svf $DOTREPO/config $HOME/.config
    fi
fi
