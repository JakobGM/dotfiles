# Instruct ZSH to read all ZSH configuration files from its XDG config directory
# This file should not be edited, edit $ZDOTDIR/.zshenv instead
# See: https://www.reddit.com/r/zsh/comments/3ubrdr/proper_way_to_set_zdotdir/
export DOTREPO=$HOME/.dotfiles
export ZDOTDIR=$DOTREPO/config/zsh
source $ZDOTDIR/.zshenv
