# For use with X11 forwarding on remote python interpreterns
export DISPLAY=localhost:10.0

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=false  # But there are some global packages that are needed

# Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export VIRTUALENVWRAPPER_PYTHON=python3
export VIRTUALENV_PYTHON=python3
source /usr/local/bin/virtualenvwrapper.sh

# For python [https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python]
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Add anaconda to PATH
export PATH=/usr/local/anaconda3/bin:"$PATH"

# Set editor used by default by other programs, for instance tmuxinator
export EDITOR=vim

# Add user binaries
export PATH="$PATH:$HOME/.dotfiles/bin"

# Use ag in order to filter out .git folders but include hidden files before fzf is invoked
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
