#!/usr/bin/env bash

#
# Batch Zip
#
# Based on:
# http://hints.macworld.com/article.php?story=20070803053156346
# http://www.macworld.com/article/1134810/zipmany.html
# http://alexsantidote.com/334/batch-zip-and-rename/
# http://askubuntu.com/questions/360063/how-to-show-a-running-clock-in-terminal-before-the-command-prompt/360172#360172
#
bz() {
  for file in "$@" ; do
    # Check that the file exists and is a regular file.
    if [ -f "$file" ] ; then
      zip --junk-paths -9 "${file%.*}.zip" "$file"
      mv "$file" "$HOME/.Trash"
    fi
  done
}

# ------------------------------------------------------------------------------

# Get info about a file or directory.
i() {
  zstat -or "$1"
  echo
  mdls "$1"
  echo
  stat -x "$1"
  echo
  file "$1"
  echo
  xattr "$1"

  # # http://www.sno.phy.queensu.ca/~phil/exiftool/
  # brew install exiftool
  # exiftool

  # # http://osxdaily.com/2010/10/19/get-mp3-file-info-on-mac/
  # afinfo "$1"
}

# ------------------------------------------------------------------------------

# Manually update things.
u() {
  upgrade_oh_my_zsh
  zplug update
  npm update -g
  gem update --system
  gem update
  pip install --upgrade pip setuptools
  brew update && brew upgrade --all && brew cleanup && brew cask cleanup
}
