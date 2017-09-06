#!/bin/zsh

# Check if zsh is installed
CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
  echo "\033[0;33m Zsh is not installed!\033[0m Please install zsh first!"
  exit
fi

# Install oh-my-zsh for the current user
# The install script takes care of dependencies 
# and existing installations!
#if [ -d $HOME/.oh-my-zsh ]; then
    #sudo rm -r $HOME/.oh-my-zsh
#fi

# Installing oh-my-zsh within a script. Source: https://github.com/robbyrussell/oh-my-zsh/issues/5873
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
    echo "Could not install Oh My Zsh" >/dev/stderr
    exit 1
}
sudo chown -R $USER:$USER $HOME/.oh-my-zsh

# Glob hidden files
setopt glob_dots

# Get location of dotfiles repo
# Important assumption: It is located at $HOME/.dotfiles
export dotrepo=$HOME/.dotfiles
echo "----------------------"
echo "Repo name: ${repo}"

# Symlink all home directory dotfiles
ln -svf $dotrepo/home/* $HOME

# Symlink all ZSH_CUSTOM files
ln -svf $dotrepo/zsh_custom/* $HOME/.oh-my-zsh/custom

# Source zsh config if the shell is zsh
if [ ! -z $ZSH ]; then
    source $HOME/.zshrc
fi

echo "-------------------------------"
OS=$(uname)
if [ "$OS" = "Linux" ]; then
    echo "Installing Linux packages"
     $dotrepo/linux/install.sh
elif [ "$OS" = "Darwin" ]; then
    echo "Setup for MacOS running..."
    $dotrepo/macOS/install.sh

    echo "Installing new MacOS packages with brew"
    brew bundle --file=$dotrepo/macOS/Brewfile
fi

# Install Vundle if it is not installed
echo
if [ ! $HOME/.vim/autoload/plug.vim ]
then
    echo "Installing VimPlug"
    sudo mv $HOME/.vim $HOME/.vim.old
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "VimPlug already installed"
fi

# This hack removes the Vim UI output 
# Source: https://github.com/VundleVim/Vundle.vim/issues/511
echo "Installing Vundle plugins"
echo | echo | vim +PluginInstall +qall &>/dev/null

echo "Installing global python packages"
python3 -m pip install --upgrade pip
python3 -m pip install --quiet --upgrade --user -r $dotrepo/python/global_requirements.txt

# Install ruby gems
sudo gem install bundler
bundle install --gemfile=$dotrepo/ruby/Gemfile
