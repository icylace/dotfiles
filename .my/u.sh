#!/usr/bin/env bash

# Manually update things.
u() {
  upgrade_oh_my_zsh
  zplug update
  npm update -g
  gem update --system
  gem update
  pip install --upgrade pip setuptools
  brew update && brew upgrade --all && brew cleanup && brew cask cleanup
}
