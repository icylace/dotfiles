#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Nix
#  The Purely Functional Package Manager
#  https://nixos.org/nix/
# ------------------------------------------------------------------------------

# https://www.ostechnix.com/getting-started-nix-package-manager/

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ] ; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# List currently installed packages.
alias n='nix-env --query --description --status'

# Do garbage collection on the local Nix package store.
alias ncg='nix-collect-garbage --delete-old'

# A runtime dependency graph of the current Nix user environment.
# https://nixos.org/nix/manual/#examples-16
# https://blog.jpalardy.com/posts/untangling-your-homebrew-dependencies/
alias ndg="nix-store --query --graph '$HOME/.nix-profile' | fdp -Tpng -o/tmp/nix-graph.png ; open /tmp/nix-graph.png"
alias ndg2="nix-store --query --graph '$HOME/.nix-profile' | dot -Tpng -o/tmp/nix-graph.png ; open /tmp/nix-graph.png"

# List generations.
alias ng='nix-env --list-generations'

# Get help.
alias nh='nix-env --help'

# Get detailed information for particular packages.
alias ni='nix-env --query --available --description --status --json'

# Installs a package by its attribute path.
alias nin='nix-env --install --attr'

# Tries to fix any issues with installed packages.
alias nr='nix-store --verify --repair --check-contents'

# Searches for packages.
alias ns='nix-env --query --available --description --status --attr-path'

# TODO: find out if the `-e` option is undocumented and/or superceded by another option
# Uninstall packages.
alias nun='nix-env -e'

# Updates a package.
alias nup='nix-env -u'

# Updates Nix expressions from subscribed channels.
alias nu='nix-channel --update'
