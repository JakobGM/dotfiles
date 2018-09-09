# Add modifications to PATH environment variable

export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then

  # Lazyload the pyenv binary
  function pyenv() {
      # Remove the function definition
      unfunction "$0"

      # Add pyenv shims and autocompletion
      eval "$(pyenv init -)"

      # Add auto-activation of virtualenvs
      eval "$(pyenv virtualenv-init -)"

      # Execute the command that was intended
      $0 "$@"
  }

  # Setup virtualenvwrapper commands
  # PS: This also installs virtualenvwrapper if missing
  source ~/.local/bin/virtualenvwrapper_lazy.sh
  # pyenv virtualenvwrapper
  export VIRTUALENV_PYTHON="/opt/pyenv/versions/3.6.6/bin/python3"
fi
