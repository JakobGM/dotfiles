#!/bin/zsh

echo "Installing Ruby gems"
sudo gem install bundler
bundle install --gemfile=$DOTREPO/ruby/Gemfile
