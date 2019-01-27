#!/bin/zsh

# MacOS aliases
alias cask='brew cask'
alias dnsflush='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'


# Misc aliases
alias zshconfig='vim $HOME/.zshrc'
alias ssh='TERM=xterm-256colors ssh'

# Git aliases
if which hub > /dev/null 2>&1; then
    eval "$(hub alias -s)"
fi
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

# Open these filetypes directly in terminal text editor when "executed"
alias -s {py,html,js,yml,yaml,md,rst,txt,conf,zsh,sh}=$EDITOR

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
if which exa > /dev/null 2>&1; then
    alias ls='exa'
    alias la='exa -la'
    alias ll='exa -l'
fi

# Unix aliases
alias x='exit'
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# ArchLinux aliases
alias ie="i3-msg exit"

# Server stuff
alias mount_do='sudo sshfs jakobgm@178.62.205.92:/ /mnt/cobalt -o IdentityFile=/home/jakobgm/.ssh/id_rsa,allow_other'
alias mount_uranium='sudo sshfs jakobgm@167.99.220.138:/ /mnt/uranium -o IdentityFile=/home/jakobgm/.ssh/id_rsa,allow_other'

# Enable/disable terminal line wraps
alias wrapoff='tput rmam'
alias wrapon='tput smam'
wrapoff
