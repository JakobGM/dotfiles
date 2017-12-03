# Use gpip to install global python packages, as pip requires virtualenv
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Use neovim as manpager in zsh
source $XDG_CONFIG_HOME/nvim/plugged/neoman.vim/scripts/nman.zsh
