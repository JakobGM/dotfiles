# --- Configuration for Oda-specific stuff ---

# Oda aliases
alias klipy="~/oda/klipy/.venv/bin/python -m klipy"
eval "$(_KLIPY_COMPLETE=source_zsh klipy)"

# Environment variables
export PATH="${PATH}:/home/jakobgm/.klipy/bin/"
