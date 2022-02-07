# --- Configuration for Oda-specific stuff ---

# Oda aliases
alias klipy="~/oda/klipy/.venv/bin/python -m klipy"
eval "$(_KLIPY_COMPLETE=source_zsh klipy)"

# Environment variables
export PATH="${PATH}:/home/jakobgm/.klipy/bin/"

# Completions for the Fabrica CLI
autoload bashcompinit && bashcompinit && eval "$(~/oda/fabrica/bin/fabrica completions)"
