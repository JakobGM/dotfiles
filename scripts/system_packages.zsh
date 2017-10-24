#!/bin/zsh

export OS=$(uname)
if [ "$OS" = "Linux" ]; then
    echo "Installing Linux packages"
     $DOTREPO/linux/install.sh
elif [ "$OS" = "Darwin" ]; then
    echo "Setup for MacOS running..."
    $DOTREPO/macOS/install.sh

    echo "Installing new MacOS packages with brew"
    brew bundle --file=$DOTREPO/macOS/Brewfile
fi
