#!/bin/zsh
# TODO: Everything
# Install all packages in $repo/ubuntu/packages.txt
# See https://askubuntu.com/questions/541781/install-list-of-packages-using-apt-get

# Check if this version of the file has already been run
this_file=$dotrepo/linux/install.sh
if md5sum --status -c ${this_file}.md5; then
        echo "Linux packages already installed."
        exit 0
fi

# NeoVim repository
sudo add-apt-repository -y ppa:neovim-ppa/unstable

# Mosh repository
sudo add-apt-repository -y ppa:keithw/mosh

sudo apt-get update -y
sudo apt-get install -y mosh
sudo apt-get install -y python-software-properties

# Install all programs TODO: Split up
sudo apt-get install -y cloc coreutils flake8 git python-pip python3 shellsheck thufuck tmux tree python3-dev python3-pip neovim

# Compile YouCompleteMe plugin for vim
# Requirements
sudo apt-get upgrade -y vim
sudo apt-get install -y build-essential cmake # For compilation
sudo apt-get install -y python-dev python3-dev

echo "Finished installing new linux packages"
md5sum "$this_file" > "${this_file}.md5"

echo "Installing fonts"
fc-cache -vf ~/.fonts
