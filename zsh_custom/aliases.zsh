#!/bin/zsh

# Aliases
alias atlas='ssh jakobgm@atlas.orakel.ntnu.no'
alias cask='brew cask'
alias dnsflush='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'
alias kokperm='sudo chmod -R 755 /Users/jakobgm/kokekunster.no/img /Users/jakobgm/kokekunster.no/arkiv /Users/jakobgm/kokekunster.no/ressurser; sudo chgrp -R _www /Users/jakobgm/kokekunster.no/img /Users/jakobgm/kokekunster.no/arkiv /Users/jakobgm/kokekunster.no/ressurser'
alias koku='ssh -t kokekunster.no "cd /var/www/kokekunster.no/public_html ; bash"'
alias kokut='ssh -t kokekunster.no "cd /var/www/test.kokekunster.no/public_html/kokekunster.no ; bash"'
alias krypton='ssh -p 2222 kokekunster.no'
alias logstud='ssh jakobgm@login.stud.ntnu.no'
alias markov='ssh -Y jakobgm@markov.math.ntnu.no'
alias matlab='cd /Applications/MATLAB_R2016a.app/bin; ./matlab -nodesktop -nosplash'
alias orakelportal='ssh -t kokekunster.no "cd /var/www/portal.orakel.ntnu.no/public_html ; bash"'
alias please='sudo !!'
alias silicon='ssh jakobgm@188.166.127.82'
alias thor='thorium'
alias thorium='ssh jakobgm@thorium.orakel.ntnu.no'
alias xenon='ssh jakobgm@kokekunster.no'
alias zeus='ssh jakobgm@zeus.orakel.ntnu.no'
alias zshconfig='vim $HOME/.zshrc'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'

# Functions
eval $(thefuck --alias)
