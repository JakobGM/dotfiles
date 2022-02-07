# ---------- SETUP ENVIRONMENT VARIABLES --------------
# Where we have placed the repository with all dotfiles
export DOTREPO=$HOME/.dotfiles
source $DOTREPO/scripts/env.zsh

# Make brew installed binaries available before the rest of the script runs
export PATH="/opt/homebrew/bin:${PATH}"


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
fpath=("$DOTREPO/home/.zsh/completions" $fpath) 
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
autoload -Uz compinit && compinit

# Completions for gcloud
if type brew &>/dev/null; then
    source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# Completions for fabrica CLI
if [[ -f ~/oda/fabrica/bin/fabrica ]]; then
    eval "$(~/oda/fabrica/bin/fabrica completions)"
fi

# Use dotfiles repository for custom zsh files
AUTOLOAD="$DOTREPO/autoload"

# Source all files in $AUTOLOAD having file extension .zsh
for file in $AUTOLOAD/*.zsh; do
    source "$file"
done

# Enable fzf related functionity, such as <C-r>
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# ----------- OS-SPECIFIC STUFF ---------------
# If on ArchLinux, start the Xorg instance
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/home/jakobgm/.netlify/helper/path.zsh.inc' ]; then source '/home/jakobgm/.netlify/helper/path.zsh.inc'; fi


# ----------------- ASDF -----------------------
source $(brew --prefix asdf)/libexec/asdf.sh

# Hook direnv into your shell.
eval "$(asdf exec direnv hook zsh)"

# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }
