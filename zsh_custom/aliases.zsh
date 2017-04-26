#!/bin/zsh

# MacOS aliases
alias cask='brew cask'
alias dnsflush='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'
alias matlab='cd /Applications/MATLAB_R2016a.app/bin; ./matlab -nodesktop -nosplash'


# Misc aliases
alias kokperm='sudo chmod -R 755 /Users/jakobgm/kokekunster.no/img /Users/jakobgm/kokekunster.no/arkiv /Users/jakobgm/kokekunster.no/ressurser; sudo chgrp -R _www /Users/jakobgm/kokekunster.no/img /Users/jakobgm/kokekunster.no/arkiv /Users/jakobgm/kokekunster.no/ressurser'
alias please='sudo !!'
alias thor='thorium'
alias zshconfig='vim $HOME/.zshrc'


# Tmux aliases
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'


# SSH aliases
alias atlas='ssh jakobgm@atlas.orakel.ntnu.no'
alias koku='ssh -t kokekunster.no "cd /var/www/kokekunster.no/public_html ; bash"'
alias kokut='ssh -t kokekunster.no "cd /var/www/test.kokekunster.no/public_html/kokekunster.no ; bash"'
alias krypton='ssh -p 2222 kokekunster.no'
alias logstud='ssh jakobgm@login.stud.ntnu.no'
alias markov='ssh -Y jakobgm@markov.math.ntnu.no'
alias orakelportal='ssh -t kokekunster.no "cd /var/www/portal.orakel.ntnu.no/public_html ; bash"'
alias silicon='ssh jakobgm@188.166.127.82'
alias thorium='ssh jakobgm@thorium.orakel.ntnu.no'
alias xenon='ssh jakobgm@kokekunster.no'
alias zeus='ssh jakobgm@zeus.orakel.ntnu.no'


# Git aliases
alias g='git'
alias gA='git add -A'
alias gc='git commit'
alias gp='git push'
