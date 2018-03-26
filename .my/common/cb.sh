#!/usr/bin/env bash

#
# Pipes in/out of the OS X clipboard.
#
# Usage: <command> | cb     # Copy stdin.
#        cb <file>          # Copy a file's contents.
#        cb | <command>     # Pipe clipboard's content into a command.
#        cb > <file>        # Paste into a file.
#
# Based on:
# https://stackoverflow.com/a/19458217
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/clipboard.zsh
#
cb() {
  if [ -p /dev/stdin ] ; then
    pbcopy
  else
    local file="$1"
    if [ -n "$file" ] ; then
      cat "$file" | pbcopy
    else
      pbpaste
    fi
  fi
}
