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
elif [ "$OS" = "darwin" ]; then
    echo "Setup for MacOS running..."
    $dotrepo/macOS/install.sh
    if [ brew bundle --file=$dotrepo/macOS/Brewfile ]; then
        echo "Installing new MacOS packages with brew"
        brew bundle --file=$dotrepo/macOS/Brewfile
    fi
fi

# Install Vundle if it is not installed
echo
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
    echo "Installing Vundle"
    sudo mv $HOME/.vim $HOME/.vim.old
    mkdir -p $HOME/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
else
    echo "Vundle already installed"
fi

# This hack removes the Vim UI output 
# Source: https://github.com/VundleVim/Vundle.vim/issues/511
echo "Installing Vundle plugins"
echo | echo | vim +PluginInstall +qall &>/dev/null

echo "Installing global python packages"
python3 -m pip install --upgrade pip
python3 -m pip install --quiet --user -r $dotrepo/python/global_requirements.txt

echo "Installing Powerline"
# Get information about the package
pow_info=`python3 -m pip show powerline-status`

# Get the location of the package
[[ $pow_info =~ 'Location: (.*site-packages)' ]] && pow_repo=$match[1]/powerline

# Symlinking .zshrc powerline config
sudo cp $pow_repo/bindings/zsh/powerline.zsh $HOME/.oh-my-zsh/custom

# Get read permissions for global python packages
sudo chown -R $USER:$USER $match[1]

# Save powerline repo path in $POWERLINE_REPO
echo "export POWERLINE_REPO=$pow_repo" > $HOME/.oh-my-zsh/custom/local_powerline.zsh

# Install powerline for the ipython interpreter too
ipython -m pip install --quiet powerline-status

# Install ruby gems
sudo gem install bundler
bundle install --gemfile=$dotrepo/ruby/Gemfile
