#!/usr/bin/env bash

# Updates multiple things.
u() {
  if we_have upgrade_oh_my_zsh ; then
    upgrade_oh_my_zsh
  fi

  if we_have zplug ; then
    zplug update
  fi

  if we_have yarn ; then
    yarn global upgrade
  fi

  if we_have npm ; then
    npm update -g
  fi

  if we_have nix-channel ; then
    nix-channel --update
  fi

  if we_have nix-env ; then
    nix upgrade-nix
    nix-env --upgrade
  fi

  if we_have nix-collect-garbage ; then
    nix-collect-garbage --delete-old
  fi

  if we_have rustup ; then
    rustup check
  fi

  if we_have stack ; then
    stack update
  fi

  if we_have gem ; then
    gem update --system
    gem update
  fi

  if we_have pip ; then
    pip install --upgrade pip setuptools
  fi

  if we_have brew ; then
    brew update && brew upgrade && brew cleanup
  fi
}
