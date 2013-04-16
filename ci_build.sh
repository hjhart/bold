#!/bin/bash -le

source .rvmrc

gem install bundler --no-ri --no-rdoc && bundle install

# debugging info
echo USER=$USER && ruby --version && which ruby && which bundle

bundle exec rake spec