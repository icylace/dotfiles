#!/usr/bin/env bash

# https://dev.to/sijils/publishing-npm-package-to-github-package-repository-5ane
alias npml="npm login --registry=https://npm.pkg.github.com/ --scope=@icylace"

setup_node() {
  local nvm_file="$(brew --prefix nvm)/nvm.sh"
  if [ -f "$nvm_file" ] ; then
    # Recommended by Homebrew.
    export NVM_DIR="$HOME/.nvm"
    source "$nvm_file"
  fi
}

setup_node
