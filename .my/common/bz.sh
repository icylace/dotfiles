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
