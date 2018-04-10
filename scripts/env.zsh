# The most important env variable of them all
export PATH=$PATH:/Users/jakobgm/.cargo/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/X11/bin:/Applications/Postgres.app/Contents/Versions/latest/bin

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

# For python [https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python]
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set editor used by default by other programs, for instance tmuxinator
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr -cc tabedit --remote-wait +'set bufhidden=wipe'"
else
  export VISUAL="nvim"
fi

export EDITOR=$VISUAL

# Add user binaries
export PATH="$PATH:$HOME/.dotfiles/bin"

# Add linuxbrew paths [http://linuxbrew.sh/]
export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"

# Add pip --user installed packages
export PATH=`python3 -c 'import site; print(site.USER_BASE)'`/bin":$PATH"

# How to invoke the fzf command, especially in fzf.vim
    # --files: List files that would be searched but do not search
    # --no-ignore: Do not respect .gitignore, etc...
    # --hidden: Search hidden files and folders
    # --follow: Follow symlinks
    # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --smart-case --files --hidden --follow --glob "!.git/*"'

# Setting default username such that it doesn´t always state it in the terminal
export DEFAULT_USER="jakobgm"

# Set which filters that should be used by "enchancd"
export ENHANCD_FILTER=fzy:fzf

# This variable should point directly to the dotfiles repository root
export DOTREPO="$HOME/.dotfiles"

# How to open MIME-types from terminal
export MAILCAPS=$DOTREPO/home/.mailcap

# Use the dotfiles-repo config folder as XDG Base Directory
export XDG_CONFIG_HOME="$DOTREPO/config"

# Application data directory
export XDG_DATA_HOME="$HOME/.local/share"

# Use the default browser to open urls from terminal
export BROWSER=open

# Fix lacking XDG_CONFIG_HOME support for gnupg
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

# Use neovim as a manpager
export MANPAGER="nvim -c 'set ft=neoman' -"

# Set vimrc location
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"

# Use nerdfont arrow for pure prompt icon
export PURE_PROMPT_SYMBOL=`echo "\uf054"`

# Set default terminal
export TERMINAL=kitty

# Fix weird GitHub/git error
# "fatal: could not read Username for 'https://github.com': terminal prompts disabled"
export GIT_TERMINAL_PROMPT=1

# Log everything at debug level for astrality for development purposes
export ASTRALITY_LOGGING_LEVEL=DEBUG

# Allaw global packages install with npm -g without use of sudo
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules


# --- Fix lacking XDG Home Directory support ---
# TMUX
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# iPython / Jupyter notebooks
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

# Xorg-server
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

# WakaTime
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"

# Prevent ranger from reading default configurations twice
export RANGER_LOAD_DEFAULT_RC=FALSE


# --- System specific environment variables ---
local OS=$(uname -o)

if [[ $OS == "GNU/Linux" ]]
then
    export BROWSER=xdg-open
fi


# --- HiDPI support in ArchLinux ---
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=1
export GDK_DPI_SCALE=1


# --- ZSH environment variables ---
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=1000000
export HISTSAVE=1000000
