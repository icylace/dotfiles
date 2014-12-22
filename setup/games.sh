#!/usr/bin/env bash


# Homebrew
# Package manager for OS X.
# http://brew.sh

# Check for Homebrew and install if we don't have it.
if [ ! "$(which brew)" ]; then
  echo 'Installing homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check if there are problems.
brew doctor

# Update Homebrew recipes.
brew update

# Access game formulas.
brew tap homebrew/homebrew-php

formulas=(

  brogue
  mame
  stockfish
  wesnoth

  # Homebrew Cask
  # Manages the administration of Mac applications distributed as binaries.
  # http://caskroom.io/
  caskroom/cask/brew-cask

)

echo 'Installing Homebrew formulas...'
brew install "${formulas[@]}"



# brew tap caskroom/cask

cask_formulas=(

  # # Gaming
  # battle-net
  # steam

)

# TODO
# - check these:
#   - openemu
#   - boxer
#   - stockfish ?
#   - alephone

brew cask install "${cask_formulas[@]}"


# ------------------------------------------------------------------------------
#  Apps to install manually via the Mac App Store.
# ------------------------------------------------------------------------------

# Joystick Show
# http://chibatacreations.com/app/joystickshow/
