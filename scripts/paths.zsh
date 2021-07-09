# Add modifications to PATH environment variable
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
else
  echo "Pyenv dependency is missing. Virtualenvwrapper disabled as a result..." >&2
fi

if which pyenv-virtualenv-init > /dev/null; then 
  eval "$(pyenv virtualenv-init -)"
else
  echo "Dependency pyenv-virtualenv missing..." >&2
fi

if which pyenv-sh-virtualenvwrapper > /dev/null; then 
  export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
  pyenv virtualenvwrapper_lazy
else
  echo "Dependency pyenv-virtualenvwrapper missing..." >&2
fi
