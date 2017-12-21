# Use gpip to install global python packages, as pip requires virtualenv
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Use neovim as manpager in zsh
local NMAN="$XDG_CONFIG_HOME/nvim/plugged/neoman.vim/scripts/nman.zsh"
if [[ -a $NMAN ]]
then
    source $NMAN
fi

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

# Precmd hook in order to get correct timing information for 'zsh-histdb'
autoload -Uz add-zsh-hook
add-zsh-hook precmd histdb-update-outcome

function zshexit() {
    # Sync the history database on every exit
    histdb-sync

    # Deactivate venv on exit
    [ "$VIRTUAL_ENV" ] && deactivate
}

