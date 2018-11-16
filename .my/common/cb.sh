#!/usr/bin/env bash

#
# Pipes in/out of the macOS clipboard.
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
    # Copy from stdin.
    pbcopy
  fi

  if [ -z "$1" ] ; then
    # Paste to stdout.
    pbpaste
    return
  fi

  if [ -f "$1" ] ; then
    # Copy a file's contents.
    pbcopy < "$1"
    return
  fi

  echo "\e[0;31mERROR: $1 is not a file and there's nothing piped in from stdin.\e[0m"
  return 1
}
