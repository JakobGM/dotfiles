# Provide ripgrep completions to hg command
compdef _rg hg

if command_exists kubectl; then
    source <(kubectl completion zsh)
fi
