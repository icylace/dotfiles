#!/usr/bin/env bash

#
# Checks if a command or program is available.
#
# Example usage:
#
#   if we_have foo ; then
#     # foo exists
#   else
#     # foo doesn't exist
#   if
#
we_have() {
  return $(type "$@" > /dev/null 2>&1)
}

# Updates multiple things.
u() {
  upgrade_oh_my_zsh
  zplug update
  if we_have npm ; then
    npm update -g
  fi
  if we_have gem ; then
    gem update --system
    gem update
  fi
  if we_have pip ; then
    pip install --upgrade pip setuptools
  fi
  brew update && brew upgrade --all && brew cleanup && brew cask cleanup
}
