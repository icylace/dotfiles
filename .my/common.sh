#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Defines aliases and functions common to both Bash and Z shell.
# ------------------------------------------------------------------------------

COMMON="$HOME/.my/common"

source "$COMMON/nix.sh"
# source "$COMMON/appledev.sh"
source "$COMMON/brew.sh"
# source "$COMMON/bz.sh"
source "$COMMON/cb.sh"
# source "$COMMON/docker.sh"
# source "$COMMON/drupal.sh"
source "$COMMON/exa.sh"
source "$COMMON/extract.sh"
source "$COMMON/git.sh"
source "$COMMON/haskell.sh"
# source "$COMMON/laravel.sh"
source "$COMMON/misc.sh"
source "$COMMON/move_into_url_directories.sh"
source "$COMMON/name.sh"
source "$COMMON/node.sh"
source "$COMMON/postgresql.sh"
source "$COMMON/purescript.sh"
source "$COMMON/sift.sh"
source "$COMMON/u.sh"
# source "$COMMON/vagrant.sh"
source "$COMMON/we_have.sh"
source "$COMMON/yadm.sh"
source "$COMMON/yarn.sh"

# ------------------------------------------------------------------------------

WEBDEV_SCAFFOLDING="$HOME/My/Code/webdev-scaffolding"

source "$WEBDEV_SCAFFOLDING/init.sh"
