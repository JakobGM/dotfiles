# ---------- SETUP ENVIRONMENT VARIABLES --------------
# Where we have placed the repository with all dotfiles
export DOTREPO=$HOME/.dotfiles

source $DOTREPO/scripts/env.zsh



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
# Use dotfiles repository for custom zsh files
AUTOLOAD="$DOTREPO/autoload"

# Source all files in $AUTOLOAD having file extension .zsh
for file in $AUTOLOAD/*.zsh; do
    source "$file"
done

# Enable fzf related functionity, such as <C-r>
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# ----------- ARCHLINUX STUFF ---------------
# If on ArchLinux, start the Xorg instance
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec xinit
fi
