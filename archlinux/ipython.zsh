#!/usr/bin/env zsh
workon sunmapper
docker exec -it sunmapper_django python3 manage.py shell_plus --ipython

# Uncomment in order to invoke the shell in a specific django project
# source $(which virtualenvwrapper.sh)
# workon otovo
# alias shell='python manage.py shell_plus --ipython'
# shell
