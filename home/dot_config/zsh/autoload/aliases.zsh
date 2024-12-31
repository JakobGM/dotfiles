#!/bin/zsh
# Check if the given command is available for gradual degradation purposes
function command_exists() {
    if ! hash "${1}" &>/dev/null
    then
        return 1
    fi
    return 0
}

# Chezmoi
alias cz='chezmoi'

# Navigate to the chezmoi source directory, open NeoVim and run ":FzfLua files"
alias dot='cd ~/.local/share/chezmoi/home && nvim -c "FzfLua files"'

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

# Make ripgrep produce hyperlinks that can be opened in the terminal
alias rg="rg --hyperlink-format=kitty"

if command_exists bat; then alias cat=bat; fi

# Mise tasks
alias m='mise'
alias mr='mise run'

mise_run() {
    local cmd=$1
    shift
    case $# in
        0) mise run $cmd ;;
        1) mise run $cmd:$1 ;;
        *) mise run $cmd:$1 "${@:2}" ;;
    esac
}

for cmd in app ci db dev fix lint; do
    eval "function $cmd() { mise_run $cmd \"\$@\"; }"
done

