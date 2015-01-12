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
#  Heavy influence and much copying from:
#  - http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
#  - http://www.defaults-write.com/
#  - https://github.com/holman/dotfiles
#  - https://github.com/kevinrenskers/dotfiles
#  - https://github.com/travi/dotfiles
#  - https://github.com/virtualswede/osx-bootstrap
#  - https://gist.github.com/brandonb927/3195465
#

source 'init.sh'

e ''
e '###############################################' $red
e '#        DO NOT RUN THIS SCRIPT BLINDLY       #' $red
e '#        YOU WILL PROBABLY REGRET IT...       #' $red
e '#                                             #' $red
e '#              READ IT THOROUGHLY             #' $red
e '#         AND EDIT TO SUIT YOUR NEEDS         #' $red
e '###############################################' $red
e ''

proceeding=false

e ''
e "Have you read through the script you're about to run and " $red
e 'understood that it will make changes to your computer? (y/n)' $red
read -r response
case $response in
  [yY]) proceeding=true
        break;;
  *) break;;
esac

if [ ! $proceeding ]; then
  e 'Please go read the script.  It only takes a few minutes.' $red
  exit
fi

# Now we begin.  Ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished.
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source 'brew.sh'
source 'cask.sh'
source 'osx.sh'

# echo 'Done.  Note that some apps and settings changs require a logout/restart to take effect.'
# sudo shutdown -r now 'Rebooting now...'

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

# cobook

# CodeBox
# Code snippets manager.
# http://www.shpakovski.com/codebox/

# DragonDrop
# File dragging helper.
# https://shinyplasticbag.com/dragondrop/

# Memory Clean
# Frees up unused memory.
# https://fiplab.com/apps/memory-clean-for-mac

# shazam

# Ulysses III
# Text document manager and editor designed for writing.
# http://ulyssesapp.com/

# Xcode
# Application development system from Apple.
# https://developer.apple.com/xcode/

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




# exit 0



# ------------------------------------------------------------------------------
#  Post-install setup.
# ------------------------------------------------------------------------------

# FirefoxDeveloperEdition#
# - add HipChat to search engine list
# - add BitBucket to search engine list




# TODO
# Figure out a way to programmatically turn off Caps Lock key
