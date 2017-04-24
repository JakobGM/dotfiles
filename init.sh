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

# Glob hidden files
setopt glob_dots

# Get location of dotfiles repo
# Important assumption: It is located at $HOME/.dotfiles
repo=$HOME/.dotfiles
echo "----------------------"
echo "Repo name: ${repo}"

# Symlink all home directory dotfiles
ln -svi $repo/home/* $HOME

# Symlink all ZSH_CUSTOM files
ln -svi $repo/zsh_custom/* $HOME/.oh-my-zsh/custom

# Source zsh config if the shell is zsh
if [ ! -z $ZSH ]; then
    source $HOME/.zshrc
fi

echo "-------------------------------"
if [ $OSTYPE = "linux-gnu" ]; then
    echo "Installing Linux packages"
     $repo/linux/install.sh
elif [ $(uname) = "darwin" ]; then
    if [ brew bundle --file=$repo/macOS/Brewfile ]; then
        echo "Installing new MacOS packages with brew"
        brew bundle --file=$repo/macOS/Brewfile
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
gpip3 install --upgrade pip
gpip3 install -r $repo/python/global_requirements.txt

echo "Installing Powerline"
# Get information about the package
pow_info=`gpip3 show powerline-status`

# Get the location of the package
[[ $pow_info =~ 'Location: (.*site-packages)' ]] && pow_repo=$match[1]/powerline

# Symlinking .zshrc powerline config
sudo cp $pow_repo/bindings/zsh/powerline.zsh $HOME/.oh-my-zsh/custom

# Get read permissions for global python packages
sudo chown -R $USER $match[1]
