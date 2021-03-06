# File for setting environment variables once at startup and never again
# Used for environment variables which should be accessible for all environments
# Read more here: https://unix.stackexchange.com/a/487889

# Configuration for pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    # Location of pyenv AUR installation
    export PYENV_ROOT="/opt/pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
