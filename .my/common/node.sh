#!/usr/bin/env bash

setup_node() {
  local nvm_file="$(brew --prefix nvm)/nvm.sh"
  if [ -f "$nvm_file" ] ; then
    # Recommended by Homebrew.
    export NVM_DIR="$HOME/.nvm"
    source "$nvm_file"
  fi
}

setup_node
