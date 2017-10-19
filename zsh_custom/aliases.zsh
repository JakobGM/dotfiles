#!/bin/zsh

# MacOS aliases
alias cask='brew cask'
alias dnsflush='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'


# Misc aliases
alias kokperm='sudo chmod -R 755 /Users/jakobgm/kokekunster.no/img /Users/jakobgm/kokekunster.no/arkiv /Users/jakobgm/kokekunster.no/ressurser; sudo chgrp -R _www /Users/jakobgm/kokekunster.no/img /Users/jakobgm/kokekunster.no/arkiv /Users/jakobgm/kokekunster.no/ressurser'
alias please='sudo !!'
alias thor='thorium'
alias zshconfig='vim $HOME/.zshrc'
alias man='tldr'


# Tmux aliases
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'


# SSH aliases
alias atlas='mosh jakobgm@atlas.orakel.ntnu.no'
alias koku='mosh -t kokekunster.no "cd /var/www/kokekunster.no/public_html ; bash"'
alias kokut='mosh -t kokekunster.no "cd /var/www/test.kokekunster.no/public_html/kokekunster.no ; bash"'
alias krypton='mosh -p 2222 kokekunster.no'
alias logstud='mosh jakobgm@login.stud.ntnu.no'
alias markov='mosh -Y jakobgm@markov.math.ntnu.no'
alias orakelportal='mosh -t kokekunster.no "cd /var/www/portal.orakel.ntnu.no/public_html ; bash"'
alias silicon='mosh jakobgm@188.166.127.82'
alias thorium='mosh jakobgm@thorium.orakel.ntnu.no'
alias xenon='mosh jakobgm@kokekunster.no'
alias zeus='mosh jakobgm@zeus.orakel.ntnu.no'


# Git aliases
alias g='git'
alias gA='git add -A'
alias gc='git commit'
alias gp='git push'
alias s='git status'
alias ss='git status --staged'


# Application aliases
alias n='nvim'
alias nn='nvim .'
alias v='vim'
alias vv='vim .'
alias matlab='cd /Applications/MATLAB_R2016a.app/bin; ./matlab -nodesktop -nosplash'
alias slack='cd ~/dev/terminal-slack/ && node main.js'
alias reddit='rtv --enable-media'


# Use exa as a replacement for ls
alias ls='exa'
alias la='exa -la'
alias ll='exa -l'
