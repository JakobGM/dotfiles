# Use dotfiles repository for custom zsh files
ZSH_CUSTOM=$HOME/.dotfiles/zsh_custom

# Source all files in $ZSH_CUSTOM having file extension .zsh
for file in $ZSH_CUSTOM/*.zsh; do
    source "$file"
done

# Enable fzf related functionity, such as <C-r>
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Install zplug zsh packages to the following path
export ZPLUG_HOME=$HOME/.zplug

# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi

# Load zplug packages from the following path
export ZPLUG_LOADFILE=$HOME/.dotfiles/zsh_custom/packages.zplug

# Source zplug package manager script
source $ZPLUG_HOME/init.zsh

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
