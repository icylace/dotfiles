#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Setup a Mac.
# ------------------------------------------------------------------------------
#
#  First, make OS X is updated and restart if necessary:
#
#      sudo softwareupdate -i -a
#
#  To use, open up ~/Applications/Utilities/Terminal then run:
#
#      bash <(curl -s https://raw.githubusercontent.com/icylace/dotfiles/master/setup/init.sh)
#
#  Heavy influence (and sometimes direct copying) from:
#  - https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
#  - http://www.defaults-write.com/
#  - https://github.com/virtualswede/osx-bootstrap
#  - https://github.com/travi/dotfiles
#

#
# http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# https://github.com/kevinrenskers/dotfiles
#


# We're only doing OS X-only stuff so abort if we're not in OS X.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

install_formulas() {

  # Install Homebrew if we need to.
  if [ ! "$(which brew)" ]; then
    # Homebrew
    # Package manager for OS X.
    # http://brew.sh
    echo 'Installing homebrew...'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Check if there are problems.
  brew doctor

  # Update Homebrew recipes.
  brew update

  # Access more recent versions of some programs that come with OS X.
  brew tap homebrew/dupes

  # Access PHP-related formulas.
  brew tap homebrew/homebrew-php

  echo 'Installing formulas...'
  brew install $(cat brews/formulas.brew | grep -v \#)

  # Check if there are problems.
  brew doctor

  # Make sure we longer have any unnecessary files laying around.
  brew cleanup

}

install_casks() {

  # Homebrew Cask
  # Manages the administration of Mac applications distributed as binaries.
  # http://caskroom.io/
  echo 'Installing Homebrew Cask'
  brew install caskroom/cask/brew-cask

  # Check if there are problems.
  brew doctor

  # Access alternate versions of programs.
  # https://github.com/caskroom/homebrew-versions
  brew tap caskroom/versions

  # Access fonts.
  # https://github.com/caskroom/homebrew-fonts
  brew tap caskroom/fonts

  # Make sure our Homebrew Cask recipes are updated.
  brew cask update

  echo 'Installing casks...'
  brew cask install $(cat brews/casks.brew | grep -v \#)

  # Check if there are problems.
  brew cask doctor

  # # Modify Alfred's search scope to include the Caskroom directory where Applications are stored.
  # # https://github.com/caskroom/homebrew-cask/issues/8052#issuecomment-66736053
  # defaults read com.runningwithcrayons.Alfred-Preferences syncfolder
  # brew cask alfred link
  # # Yosemite's Spotlight is good enough for me.

  # Make sure we longer have any unnecessary files laying around.
  brew cleanup
  brew cask cleanup

  # Activate the Quick Look plugins.
  qlmanage -r


  # brew cask install dropbox --force --download

  # Upgrading Casks
  # https://github.com/caskroom/homebrew-cask/issues/7884#issuecomment-66114740
  # brew cask uninstall --force <token> && brew cask install <token>.

}

install_formulas
install_casks

source 'osx.sh'

# echo "Done. Note that some of these changes require a logout/restart to take effect."

# Reboot the system because some apps require a restart before becoming active.
sudo shutdown -r now 'Rebooting now...'


# ------------------------------------------------------------------------------
#  Other formulas.
# ------------------------------------------------------------------------------

# # Composer
# # http://getcomposer.org/
# composer
# TODO

# # FFmpeg
# # Audio and video converter, recorder, and streamer.
# # http://ffmpeg.org/
# ffmpeg

# # id3tool
# # ID3 tag editor.
# # http://nekohako.xware.cx/id3tool/
# id3tool

# aspell

# terminal-notifier

# # trash
# # Moves files and folders to the OS X trash.
# # http://hasseg.org/trash/
# #
# # TODO
# # - maybe redefine rm behavior instead ?
# #
# trash


# ------------------------------------------------------------------------------
#  Other casks.
# ------------------------------------------------------------------------------

# # LastPass
# # A password manager.
# laspass
# # Run `open -a 'LastPass Installer'` to complete installation.

# Flavours
# System themer.
# http://flavours.interacto.net/
#
# Yosemite support forth-coming:
# https://interacto.zendesk.com/entries/53605899-Yosemite-and-the-future-Flavours-2
#
# flavours

#
# Considering:
#

# adobe-creative-cloud - use CS6 instead ?
# macpaw-gemini
# hazel - useful to me ?
# justlooking - use xee instead ?
# ripit - still useful ?
# xact - still useful ?
# xee - use justlooking instead ?
# fontexplorer-x-pro - still useful ?
# deeper
# maintenance
# tinkertool
# mamp
# clamxav
# atom - still useful to mew ?
# hex-fiend - useful to me ?
# omnigraffle - still useful ?
# omnigraffle-professional5 - still useful ?
# skim - useful to me ?
# xscope - still useful to me ?
# carbon-copy-cloner - use time machine instead ?
# jewelrybox - still useful ?
# sitesucker - still useful ?
# soundflower - still useful ?

# copy - still useful ?
# pdfpenpro - still useful ?
# thunderbird-beta - useful for archiving email ?


# qlBitRate
# Displays the bit rate and filename of an MP3 file in the title bar of the QuickLook window.
# https://github.com/jordansaints/qlBitRate


# ------------------------------------------------------------------------------
#  Git-related utilities.
# ------------------------------------------------------------------------------

# # git-smart
# # Extra commands for Git.
# # https://github.com/geelen/git-smart
# gem install git-smart


# http://nodejs.org/
# cecho "Installing node (without npm)" $blue
# # For more info, see here https://gist.github.com/DanHerbert/9520689
# brew install node --without-npm
# echo prefix=~/.node >> ~/.npmrc
# curl -L https://www.npmjs.org/install.sh | sh
# export PATH="$HOME/.node/bin:$PATH"


# ------------------------------------------------------------------------------
#  Apps to install manually via the Mac App Store.
# ------------------------------------------------------------------------------

# CodeBox
# Code snippets manager.
# http://www.shpakovski.com/codebox/

# DragonDrop
# File dragging helper.
# https://shinyplasticbag.com/dragondrop/

# Memory Clean
# Frees up unused memory.
# https://fiplab.com/apps/memory-clean-for-mac

# Ulysses III
# Text document manager and editor designed for writing.
# http://ulyssesapp.com/

# Xcode
# Application development system from Apple.
# https://developer.apple.com/xcode/

# cobook - still useful ?
# shazam - useful to me ?
# celtx - still useful ?
# tunatic - useful to me ?
# colorchooser ?
# fontdoctor ?
# fontvista ?
# Adobe CC ?
# Adobe CS6 - use CC instead ?
# winclone - still useful ?
# jackpilot - still useful ?
# plug spy - still useful ?
# folderteint - anything better ?
# hourguard - still useful ?
# time track pro - still useful ?
# sugarsync - still useful ?
# elephant drive - still useful ?
# shade - still useful ?
# iserial reader - still useful to mew ?


# ------------------------------------------------------------------------------
#  Apps to install manually.
# ------------------------------------------------------------------------------

# Breakaway 2.1
# iTunes playback controller.
# https://github.com/steakknife/breakaway
# Fork of http://mutablecode.com/apps/breakaway.html

# Neat
# Document scanner and manager.
# http://www.neat.com/

# Obsidian Menu Bar
# A hack that makes your OS X menu bar black.
# http://obsidianmenubar.com/

# Tagger
# http://hasseg.org/tagger/
# - anything better ?
