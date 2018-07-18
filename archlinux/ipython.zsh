#!/usr/bin/env zsh
source $(which virtualenvwrapper.sh)
workon otovo
alias shell='python manage.py shell_plus --ipython'
shell
