#!/bin/zsh

# Install VimPlug if it is not installed
echo
if [ ! $HOME/.vim/autoload/plug.vim ]
then
    echo "Installing VimPlug"
    sudo mv $HOME/.vim $HOME/.vim.old
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "VimPlug already installed"
fi

# This hack removes the Vim UI output 
# Source: https://github.com/VundleVim/Vundle.vim/issues/511
echo "Installing Vundle plugins"
echo | echo | vim +PluginInstall +qall &>/dev/null

