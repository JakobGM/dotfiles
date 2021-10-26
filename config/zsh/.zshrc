# ---------- SETUP ENVIRONMENT VARIABLES --------------
# Where we have placed the repository with all dotfiles
export DOTREPO=$HOME/.dotfiles

source $DOTREPO/scripts/env.zsh



# ---------------- ZSH OPTIONS -------------------
# Record timestamp of command in HISTFILE
setopt extended_history

# Use temporary file and copy on completion (history)
setopt hist_save_by_copy

# Let parallel zsh instances write to history
setopt inc_append_history

# Share history between running sessions
setopt share_history

# Ignore duplicate history
setopt hist_ignore_dups

# Delete duplicates first when HISTFILE size exceeds HISTSIZE (in memory)
setopt hist_expire_dups_first

# Allow interactive comments directly in interpreter
setopt interactivecomments

# Don't save commands that start with space
setopt hist_ignore_space


# --------------- INSTALL ZPLUG ------------------
# Install zplug zsh packages to the following path
export ZPLUG_HOME=$XDG_CONFIG_HOME/zplug

# Cache zplug plugins in order to improve zsh startup time
export ZPLUG_USE_CACHE=true

# Load zplug packages from the following path
export ZPLUG_LOADFILE="$DOTREPO/scripts/packages.zplug"

# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  echo "Installing zplug..."

  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self

  echo "Zplug has been installed"
fi

# Source zplug package manager script
source $ZPLUG_HOME/init.zsh

# Then, source plugins and add commands to $PATH
zplug load



# -------- SOURCE CUSTOM ZSH SCRIPTS ---------
# Autocompletions for Hub git wrapper
# Must be done before any completions set by the autoload directory
fpath=(~/.dotfiles/home/.zsh/completions $fpath) 
autoload -U compinit && compinit

# Use dotfiles repository for custom zsh files
AUTOLOAD="$DOTREPO/autoload"

# Source all files in $AUTOLOAD having file extension .zsh
for file in $AUTOLOAD/*.zsh; do
    source "$file"
done

# Enable fzf related functionity, such as <C-r>
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path modifications which need to be sourced last
source $DOTREPO/scripts/paths.zsh



# ----------- ARCHLINUX STUFF ---------------
# If on ArchLinux, start the Xorg instance
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/home/jakobgm/.netlify/helper/path.zsh.inc' ]; then source '/home/jakobgm/.netlify/helper/path.zsh.inc'; fi

# Miniconda3
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Dirty hack to unset VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--no-site-packages"
# Can't find out where this is set at the moment.
unset VIRTUALENVWRAPPER_VIRTUALENV_ARGS
