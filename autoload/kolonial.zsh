# --- Kolonial.no stuff ---
# Autocomplete for dbt
autoload -U +X bashcompinit && bashcompinit
source "$DOTREPO/autoload/dbt-completions.bash"
eval "$(direnv hook zsh)"

