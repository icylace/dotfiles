#!/usr/bin/env bash

setup_node() {
  if type brew > /dev/null 2>&1 ; then
    local nvm_file="$(brew --prefix nvm)/nvm.sh"
    if [ -f "$nvm_file" ] ; then
      # Recommended by Homebrew.
      export NVM_DIR="$HOME/.nvm"
      source "$nvm_file"

      # # Recommended by Node Version Manager.
      # nvm use --delete-prefix v9.9.0 --silent
    fi
  fi
}

setup_node
