#!/usr/bin/env bash

# Updates multiple things.
u() {
  upgrade_oh_my_zsh
  zplug update
  if we_have npm ; then
    npm update -g
  fi
  # if we_have gem ; then
  #   gem update --system
  #   gem update
  # fi
  # if we_have pip ; then
  #   pip install --upgrade pip setuptools
  # fi
  brew update && brew upgrade && brew cleanup && brew cask cleanup
}
