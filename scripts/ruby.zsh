#!/bin/zsh

if [ "$(uname 2> /dev/null)" != "Darwin" ]; then
    echo "Installing Ruby gems"
    sudo gem install bundler
    bundle install --gemfile=$DOTREPO/ruby/Gemfile
fi
