# The most important env variable of them all
export PATH=$PATH:/Users/jakobgm/.cargo/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/X11/bin:/Applications/Postgres.app/Contents/Versions/latest/bin

# For use with X11 forwarding on remote python interpreterns
# export DISPLAY=localhost:10.0

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true  # But there are some global packages that are needed

# Virtual Environment
export PROJECT_HOME="$HOME/dev"

# For python [https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python]
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# The name of the python (mk)project which is currently the main project
export MAIN_PYTHON_PROJECT='cloud'

# Always use ptipython in shell_plus django-admin command
export SHELL_PLUS='ptipython'

# Set editor used by default by other programs, for instance tmuxinator
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr -cc tabedit --remote-wait +'set bufhidden=wipe'"
else
  export VISUAL="nvim"
fi

export EDITOR=$VISUAL

# Add user binaries
export PATH="$HOME/.local/share/chezmoi/bin:$PATH"

# Add linuxbrew paths [http://linuxbrew.sh/]
export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"

# Add pip --user installed packages
export PATH=`python3 -c 'import site; print(site.USER_BASE)'`/bin":$PATH"

# Add cargo installed binaries
export PATH="$HOME/.cargo/bin:$PATH"

# How to invoke the fzf command, especially in fzf.vim
    # --type file: List only files
    # --hidden: Search hidden files and folders; naming starting with a period (.)
export FZF_DEFAULT_COMMAND='fd --type file --hidden'

# Use bat to preview content in fzf
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Setting default username such that it doesn´t always state it in the terminal
export DEFAULT_USER="jakobgm"

# ENHANCD settings
export ENHANCD_FILTER=fzf
export ENHANCD_DIR="$XDG_CONFIG_HOME/enhancd"
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_DOT=1
export ENHANCD_HOOK_AFTER_CD='ls -l'
export ENHANCD_USE_FUZZY_MATCH=1

# How to open MIME-types from terminal
export MAILCAPS="$HOME/.mailcap"

# Use the dotfiles-repo config folder as XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"

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

# Set default terminal
export TERMINAL=kitty

# Fix weird GitHub/git error
# "fatal: could not read Username for 'https://github.com': terminal prompts disabled"
export GIT_TERMINAL_PROMPT=1

# Log everything at debug level for astrality for development purposes
export ASTRALITY_LOGGING_LEVEL=DEBUG

# Allaw global packages install with npm -g without use of sudo
export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# Make the dotfiles repository the home for Astrality
export ASTRALITY_CONFIG_HOME="$HOME/.local/share/chezmoi/"

# Add ruby gems to path
export PATH="$HOME/.gem/ruby/2.5.0/bin:${PATH}"


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

# Weechat IRC client
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat


# --- System specific environment variables ---
local OS=$(uname)

if [[ $OS == "Linux" ]]
then
    export BROWSER=xdg-open
fi


# --- HiDPI support in ArchLinux ---
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=1
export GDK_DPI_SCALE=1


# --- ZSH environment variables ---
# Where to save ZSH command history
export HISTFILE="$XDG_DATA_HOME/zsh/history"
mkdir -p $(dirname $HISTFILE) && touch $HISTFILE

# The maximum number of history events to save in the history file (on disk)
export SAVEHIST=1000000

# The maximum number of events stored in the internal history list (in memory)
export HISTSIZE=1000000

# git-secret configuration
export SECRETS_GPG_COMMAND='gpg2'

export R_PDFVIEWER='zathura'


# --- Fix webkit+nvidia issue resulting in blank GUIs ---
# https://askubuntu.com/questions/1493204/apps-using-webkit-like-foliate-wike-caveliar-or-gnome-web-do-not-show-content
if [ -n "$(lsmod | grep nvidia)" ]; then
    export WEBKIT_DISABLE_DMABUF_RENDERER=1
fi
