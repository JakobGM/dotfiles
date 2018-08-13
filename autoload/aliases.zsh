#!/bin/zsh

# MacOS aliases
alias cask='brew cask'
alias dnsflush='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'


# Misc aliases
alias zshconfig='vim $HOME/.zshrc'
alias ssh='TERM=xterm-256colors ssh'

# Git aliases
eval "$(hub alias -s)"
alias g="git"
alias gpgdisable="git config commit.gpgsign false"
alias gpgenable="git config commit.gpgsign true"
alias gitlock="git update-index --assume-unchanged"
alias gitunlock="git update-index --no-assume-unchanged"
alias resign="git rebase --exec 'git commit --amend --no-edit -n -S' -i "
alias ds='diff-so-fancy'
alias ud="kitty +kitten diff"

# Application aliases
alias n='nvim'
alias nn='nvim .'


# Python aliases
alias pytest='python3 -m pytest'
alias ipython='python3 -m IPython'
alias w='workon'
alias pt='ptw -- -vv -x --failed-first'
alias pd='ptw -- --reuse-db --failed-first -x -vv'
alias prs='python manage.py runserver'

# Start documentation server (Sphinx)
alias ds='sphinx-autobuild . _build --host 192.168.1.225'

# Use exa as a replacement for ls
alias ls='exa'
alias la='exa -la'
alias ll='exa -l'

# Unix aliases
alias x='exit'
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# ArchLinux aliases
alias ie="i3-msg exit"
