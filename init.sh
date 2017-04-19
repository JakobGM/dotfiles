#!/bin/zsh

# Install oh-my-zsh for the current user
# The install script takes care of dependencies 
# and existing installations!
#if [ -d $HOME/.oh-my-zsh ]; then
    #sudo rm -r $HOME/.oh-my-zsh
#fi

# Installing oh-my-zsh within a script. Source: https://github.com/robbyrussell/oh-my-zsh/issues/5873
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
    echo "Could not install Oh My Zsh" >/dev/stderr
    exit 1
}

# Glob hidden files
setopt glob_dots

# Get location of dotfiles repo
# Important assumption: It is located at $HOME/.dotfiles
repo=$HOME/.dotfiles
echo "----------------------"
echo "Repo name: "$repo

# Symlink all home directory dotfiles
ln --symbolic --verbose --interactive $repo/home/* $HOME

# Symlink all ZSH_CUSTOM files
ln -svi $repo/zsh_custom/* $HOME/.oh-my-zsh/custom

# Source zsh config if the shell is zsh
if [ ! -z $ZSH ]; then
    source $HOME/.zshrc
fi

# Install packages based on OS (TODO!)
if [ $os = "ubuntu" ]; then
    bash $repo/ubuntu/install.sh
elif [ $os = "macOS" ]; then
    save_pwd=$pwd
    cd $repo/macOS
    brew tap homebrew/bundle
    brew bundle
    cd $save_pwd
fi

# Install Vundle if it is not installed
echo
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
    echo "Installing Vundle"
    sudo mv $HOME/.vim $HOME/.vim.old
    mkdir -p $HOME/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
else
    echo "Vundle already installed"
fi

# Install all vim plugins with Vundle
vim +PluginInstall +qall
