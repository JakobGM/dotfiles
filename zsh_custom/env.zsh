# For use with X11 forwarding on remote python interpreterns
# export DISPLAY=localhost:10.0

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true  # But there are some global packages that are needed

# Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export VIRTUALENVWRAPPER_PYTHON=python3
export VIRTUALENV_PYTHON=python3
export VIRTUALENVWRAPPER_WORKON_CD=1
export VIRTUALENVWRAPPER_HOOK_DIR=$DOTREPO/python/virtualenvwrapper_hook_dir
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source "$(which virtualenvwrapper.sh)"

# For python [https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python]
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set editor used by default by other programs, for instance tmuxinator
export EDITOR=nvim

# Add user binaries
export PATH="$PATH:$HOME/.dotfiles/bin"

# Add linuxbrew paths [http://linuxbrew.sh/]
export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"

# How to invoke the fzf command, especially in fzf.vim
    # --files: List files that would be searched but do not search
    # --no-ignore: Do not respect .gitignore, etc...
    # --hidden: Search hidden files and folders
    # --follow: Follow symlinks
    # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Setting default username such that it doesn´t always state it in the terminal
export DEFAULT_USER="jakobgm"

# Use rustgrep for fzf, grep hidden files, but ignore .git folders
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Set which filters that should be used by "enchancd"
export ENHANCD_FILTER=fzy:fzf

# This variable should point directly to the dotfiles repository root
export DOTREPO="$HOME/.dotfiles"

# How to open MIME-types from terminal
export MAILCAPS=$DOTREPO/home/.mailcap

# Use the dotfiles-repo config folder as XDG Base Directory
export XDG_CONFIG_HOME=$DOTREPO/config

# Use the default browser to open urls from terminal
export BROWSER=open
