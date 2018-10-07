#!/usr/bin/env bash

#
# Batch Zip
#
# Based on:
# https://hints.macworld.com/article.php?story=20070803053156346
# https://www.macworld.com/article/1134810/zipmany.html
#
# TODO:
# - confirm this still works
#
bz() {
  # for file in $@ ; do
  for file in "$@" ; do
    # Check that the file exists and is a regular file.
    if [ -f "$file" ] ; then
      # zip --junk-paths -9 ${file%.*}.zip "$file"
      zip --junk-paths -9 "${file%.*}.zip" "$file"
      mv "$file" "$HOME/.Trash"
    fi
  done
}
