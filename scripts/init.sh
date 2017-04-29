#!/bin/sh
# This script contains all the setup required before the zsh script
# init.zsh can be run. This is kept as small as possible, as I prefer
# to write in zsh-syntax instead of bash

# OS-specific set-u
echo "-------------------------------"
if [ "$OSTYPE" = "linux-gnu" ]; then
    sudo apt-get install zsh
elif [ "$(uname)" = "darwin" ]; then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Installing cask"
    brew tap caskroom/cask
    echo "Installing zsh"
    brew install zsh
fi

# Running the rest if the init script as zsh
"$HOME/.dotfiles/scripts/init.zsh"
