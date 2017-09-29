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

# Cache zplug plugins in order to improve zsh startup time
export ZPLUG_USE_CACHE=true

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

# Precmd hook in order to get correct timing information for 'zsh-histdb'
autoload -Uz add-zsh-hook
add-zsh-hook precmd histdb-update-outcome

# Sync the history database on every exit
function zshexit() {
    histdb-sync
}

# This will find the most frequently issued command issued exactly in this directory,
# or if there are no matches it will find the most frequently issued command in any directory.
_zsh_autosuggest_strategy_histdb_top() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv
order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}
ZSH_AUTOSUGGEST_STRATEGY=histdb_top
