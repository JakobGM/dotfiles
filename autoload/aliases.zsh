#!/bin/zsh

# MacOS aliases
alias cask='brew cask'
alias dnsflush='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'


# Misc aliases
alias kokperm='sudo chmod -R 755 /Users/jakobgm/kokekunster.no/img /Users/jakobgm/kokekunster.no/arkiv /Users/jakobgm/kokekunster.no/ressurser; sudo chgrp -R _www /Users/jakobgm/kokekunster.no/img /Users/jakobgm/kokekunster.no/arkiv /Users/jakobgm/kokekunster.no/ressurser'
alias thor='thorium'
alias zshconfig='vim $HOME/.zshrc'


# Tmux aliases
alias tmux="tmux -f \"$XDG_CONFIG_HOME/tmux/tmux.conf\""
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
eval "$(hub alias -s)"
alias g="git"
alias gA="git add -A"
alias gc="git commit"
alias gp="git push --follow-tags"
alias s="git status"
alias ss="git status --staged"
alias pc='pip-compile'
alias ps='pip-sync'
alias gpgdisable="git config commit.gpgsign false"
alias gpgenable="git config commit.gpgsign true"
alias gitlock="git update-index --assume-unchanged"
alias gitunlock="git update-index --no-assume-unchanged"
alias resign="git rebase --exec 'git commit --amend --no-edit -n -S' -i "

# Application aliases
alias n='nvim'
alias nn='nvim .'
alias v='vim'
alias vv='vim .'
alias matlab='cd /Applications/MATLAB_R*.app/bin; ./matlab -nodesktop -nosplash'
alias slack="TERM='linux' $DOTREPO/bin/slack-term -config $XDG_CONFIG_HOME/slack-term/slack-term.json"
alias reddit='rtv --enable-media'
# alias kitty='/Applications/kitty.app/Contents/MacOS/kitty --config $XDG_CONFIG_HOME/kitty/kitty.conf'


# Python aliases
alias pytest='python3 -m pytest'
alias ipython='python3 -m IPython'
alias pip-sync="\pip-sync $DOTREPO/python/venv_requirements.txt requirements.txt"
alias w='workon'

# Django aliases
alias da='django-admin'

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
