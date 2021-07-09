# Make sure that workon is called in subshells, ensuring vim using the correct venv
# https://vi.stackexchange.com/questions/7644/use-vim-with-virtualenv/7654#7654
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# Source rest of ZSH config files from ZDOTDIR
# http://zsh.sourceforge.net/Intro/intro_3.html
export XDG_CONFIG_HOME="$HOME/.dotfiles/config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
