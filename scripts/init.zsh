#!/bin/zsh

# Check if zsh is installed
CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
  echo "\033[0;33m Zsh is not installed!\033[0m Please install zsh first!"
  exit 1
fi

# Get location of dotfiles repo
# Important assumption: It is located at $HOME/.dotfiles
export DOTREPO=$HOME/.dotfiles

SEPERATOR="\n--------------------------------------------------------------"
echo $SEPERATOR
echo "Starting dotfiles initialization script for ZSH"

echo $SEPERATOR
echo "Repo name: ${DOTREPO}"

echo $SEPERATOR
source "$DOTREPO/scripts/symlinker.zsh"

echo $SEPERATOR
source "$DOTREPO/scripts/system_packages.zsh"

echo $SEPERATOR
source "$DOTREPO/scripts/vim.zsh"

echo $SEPERATOR
source "$DOTREPO/scripts/ruby.zsh"
