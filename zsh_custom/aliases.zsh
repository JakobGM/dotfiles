#!/bin/zsh

# Aliases
alias atlas='ssh jakobgm@atlas.orakel.ntnu.no'
alias dnsflush='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'
alias krypton='ssh -p 2222 kokekunster.no'
alias koku='ssh -t kokekunster.no "cd /var/www/kokekunster.no/public_html ; bash"'
alias kokut='ssh -t kokekunster.no "cd /var/www/test.kokekunster.no/public_html/kokekunster.no ; bash"'
alias xenon='ssh jakobgm@kokekunster.no'
alias zeus='ssh jakobgm@zeus.orakel.ntnu.no'
alias orakelportal='ssh -t kokekunster.no "cd /var/www/portal.orakel.ntnu.no/public_html ; bash"'
alias silicon='ssh jakobgm@188.166.127.82'
alias kokperm='sudo chmod -R 755 /Users/jakobgm/kokekunster.no/img /Users/jakobgm/kokekunster.no/arkiv /Users/jakobgm/kokekunster.no/ressurser; sudo chgrp -R _www /Users/jakobgm/kokekunster.no/img /Users/jakobgm/kokekunster.no/arkiv /Users/jakobgm/kokekunster.no/ressurser'
alias matlab='cd /Applications/MATLAB_R2016a.app/bin; ./matlab -nodesktop -nosplash'
alias thorium='ssh jakobgm@thorium.orakel.ntnu.no'
alias thor='thorium'
alias logstud='ssh jakobgm@login.stud.ntnu.no'
alias zshconfig='vim $HOME/.zshrc'
alias markov='ssh -Y jakobgm@markov.math.ntnu.no'

