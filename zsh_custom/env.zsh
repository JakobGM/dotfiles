# For use with X11 forwarding on remote python interpreterns
export DISPLAY=localhost:10.0

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# Install global python packages with 'gpip install --upgrade pip setuptools wheel virtualenv'
gpip(){   PIP_REQUIRE_VIRTUALENV="" sudo -H pip "$@"
}
gpip3(){   PIP_REQUIRE_VIRTUALENV="" sudo -H pip3 "$@"
}

# Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export VIRTUALENVWRAPPER_PYTHON=python3
export VIRTUALENV_PYTHON=python3
source /usr/local/bin/virtualenvwrapper.sh
