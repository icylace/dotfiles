#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Setup Sublime Text 3 settings sync.
#  Based on:  https://packagecontrol.io/docs/syncing#dropbox-osx
# ------------------------------------------------------------------------------

cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
mkdir ~/My/Dropbox/Sync/Sublime\ Text\ packages
mv User ~/My/Dropbox/Sync/Sublime\ Text\ packages
ln -s ~/My/Dropbox/Sync/Sublime\ Text\ packages/User
