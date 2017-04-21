#!/bin/bash
# TODO: Everything
# Install all packages in $repo/ubuntu/packages.txt
# See https://askubuntu.com/questions/541781/install-list-of-packages-using-apt-get

sudo apt-get update -y
sudo add-apt-repository -y ppa:keithw/mosh
sudo apt-get install -y mosh
sudo apt-get install -y python-software-properties

# Install all programs TODO: Split up
sudo apt-get install -y cloc coreutils flake8 git python-pip python3 shellsheck thufuck tmux tree python3-dev python3-pip

# Compile YouCompleteMe plugin for vim
# Requirements
sudo apt-get upgrade -y vim
sudo apt-get install -y build-essential cmake # For compilation
sudo apt-get install -y python-dev python3-dev

# Swap file in case if on a memory-deprived VCS
sudo fallocate -l 1G /tempSwapFile
sudo chmod 600 /tempSwapFile
sudo mkswap /tempSwapFile
sudo swapon /tempSwapFile

pwd_old=`pwd`
cd $HOME/.vim/bundle/YouCompleteMe
./install.py 
cd $pwd_old

# Remove the swapfile again
sudo swapoff /tempSwapFile
sudo rm -r /tempSwapFile
