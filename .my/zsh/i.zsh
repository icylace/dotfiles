#!/usr/bin/env zsh

# Get info about a file or directory.
i() {
  zstat -or "$1"
  echo
  zstat -Lsn "$1"
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
