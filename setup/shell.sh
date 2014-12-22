#!/usr/bin/env bash

#
# Installs programs via Homebrew.
#
# To use, open up ~/Applications/Utilities/Terminal then run:
#
#     bash <(curl -s https://raw.githubusercontent.com/icylace/dotfiles/master/setup/osx-defaults.sh)
#

#
# Heavy influence (and sometimes direct copying) from:
# https://mths.be/osx
# https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
# http://www.defaults-write.com/
#

#
# http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# https://github.com/kevinrenskers/dotfiles
#


# Homebrew
# Package manager for OS X.
# http://brew.sh

# Check for Homebrew and install if we don't have it.
if [ ! "$(which brew)" ]; then
  echo 'Installing homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Set computer name (as done via System Preferences → Sharing)
#sudo scutil --set ComputerName "0x6D746873"
#sudo scutil --set HostName "0x6D746873"
#sudo scutil --set LocalHostName "0x6D746873"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# Check if there are problems.
brew doctor

# Update Homebrew recipes.
brew update

# Access more recent versions of some programs that come with OS X.
brew tap homebrew/dupes

# Access versioned formulas.
brew tap homebrew/homebrew-php

# Access PHP-related formulas.
brew tap homebrew/homebrew-php

formulas=(

  #
  # Updated versions of programs that come with OS X.
  #

  # Bash: The GNU Bourne-Again SHell
  # A Unix shell.
  # https://tiswww.case.edu/php/chet/bash/bashtop.html
  bash

  # A newer grep compared to the one that somes with OS X.
  grep

  # Homebrew Cask
  # Manages the administration of Mac applications distributed as binaries.
  # http://caskroom.io/
  caskroom/cask/brew-cask

  # GNU core utilities (those that come with OS X are outdated).
  coreutils

  # https://github.com/drush-ops/drush
  drush

  # duti
  # Set default applications for document types and URL schemes.
  # http://duti.org/
  duti

  # http://ffmpeg.org/
  ffmpeg

  # GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed.
  findutils

  # http://git-scm.com/
  git

  # http://www.graphicsmagick.org/
  graphicsmagick

  # https://github.com/jakubroztocil/httpie
  httpie

  # https://hub.github.com/
  hub

  # http://nekohako.xware.cx/id3tool/
  # id3tool

  # http://stedolan.github.io/jq/
  jq

  # http://ivarch.com/programs/pv
  pv

  # https://www.python.org/
  python

  # http://plasmasturm.org/code/rename/
  rename

  # http://geoff.greer.fm/ag/
  the_silver_searcher

  # http://hasseg.org/trash/
  trash

  # http://mama.indstate.edu/users/ice/tree/
  tree

  # GNU Wget
  # Retrieves files using HTTP, HTTPS, and FTP.
  # http://www.gnu.org/software/wget/
  wget

  # Z shell
  # A Unix shell.
  # http://zsh.sourceforge.net/
  zsh

)

echo 'Installing Homebrew formulas...'
brew install "${formulas[@]}"


# http://nodejs.org/
# cecho "Installing node (without npm)" $blue
# # For more info, see here https://gist.github.com/DanHerbert/9520689
# brew install node --without-npm
# echo prefix=~/.node >> ~/.npmrc
# curl -L https://www.npmjs.org/install.sh | sh
# export PATH="$HOME/.node/bin:$PATH"
