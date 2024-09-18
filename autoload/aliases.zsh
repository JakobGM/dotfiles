#!/bin/zsh
# Check if the given command is available for gradual degradation purposes
function command_exists() {
    if ! hash "${1}" &>/dev/null
    then
        return 1
    fi
    return 0
}

# Git aliases
if which hub > /dev/null 2>&1; then
    eval "$(hub alias -s)"
fi
alias g="git"
alias gpgdisable="git config commit.gpgsign false"
alias gpgenable="git config commit.gpgsign true"
alias ds='diff-so-fancy'
alias ud="kitty +kitten diff"

# Application aliases
alias n='nvim'
alias nn='nvim .'

# Kubernetes aliases
alias k='kubectl'

# Use exa as a replacement for ls
if command_exists exa; then
    alias ls='exa --group-directories-first'
    alias la='exa -la --group-directories-first'
    alias ll='exa -l --group-directories-first'
else
    alias la='ls -la'
    alias ll='ls -l'
fi

# Unix aliases
alias x='exit'
alias c='clear'
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# ArchLinux aliases
alias ie="i3-msg exit"

# Enable/disable terminal line wraps
alias wrapoff='tput rmam'
alias wrapon='tput smam'

# Cat image to terminal using kitty terminal
alias icat="kitty +kitten icat"

if command_exists bat; then alias cat=bat; fi

# Mise tasks
alias m='mise'
alias mr='mise run'
function app() {mise run app:$1 ${@:2}}
function ci() {mise run ci:$1 ${@:2}}
function db() {mise run db:$1 ${@:2}}
function dev() {mise run dev:$1 ${@:2}}
function fix() {mise run fix:$1 ${@:2}}
function lint() {mise run lint:$1 ${@:2}}
