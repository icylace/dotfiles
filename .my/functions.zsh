#!/usr/bin/env zsh

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

#
# NAME
#     c - See the contents of a directory or file.
#
# SYNOPSIS
#     c [file] [only-view]
#
# DESCRIPTION
#     If no input is given then it will list the contents of current the
#     directory.  Piped-in input and text file are are highlighted and
#     displayed.  Directories will get their contents listed.  Depending
#     upon the existence of a second argument the current directory is
#     switched to the one being looked at.
#
# NOTES
#     The original reason why I made this was because I usually want to see
#     immediately the contents of a directory I switch to.
#
#     Executing 'cd' with no arguments changes to the home directory but I have
#     `c` simply list the current directory in that case.
#
#     The following are used if they are installed:
#     - `catimg`: https://github.com/posva/catimg
#     - `highlight`: http://andre-simon.de/doku/highlight/en/highlight.php
#     - `k`: https://github.com/rimraf/k
#     - `z`: https://github.com/rupa/z
#
# TODO
# - use `hexdump -C` for binaries
# - appropriately handle other non-regular files
#   - socket
#   - block special
#   - character special
#
c() {
  local highlight_options=(
    --failsafe
    --line-numbers
    --quiet
    --style=andes
    --out-format=xterm256
  )

  # Input that's piped-in is highlighted and displayed.
  if [ -p /dev/stdin ] ; then
    highlight $highlight_options
    return
  fi

  # If we're given an argument then that probably means we're not interested
  # in looking at the file list for the current directory.
  if [ -n "$1" ] ; then

    # http://stackoverflow.com/a/567787/1935675
    if [ -x "$1" ] && [ $(file --brief --mime "$1" | grep --count --regexp='^text/') -eq 0 ] ; then
      echo "\"$1\" is a binary executable."
      return
    fi

    # If we're given a regular file then view it.
    if [ -f "$1" ] ; then
      local it_is_an_image=$(file --brief "$1" | grep --count --regexp=image)
      if [ "$it_is_an_image" -ne 0 ] ; then
        if type catimg >/dev/null 2>&1 ; then
          catimg -l 0 "$@"
        fi
      elif type highlight >/dev/null 2>&1 ; then
        highlight $highlight_options "$@" | less -FX
      else
        # http://unix.stackexchange.com/a/86324
        less -FX "$@"
      fi
      return
    fi

    # At this point we know we're not dealing with a regular file.
    # It's probably a directory.  If there's a second argument given
    # then that means we don't want to try to switch to that directory.
    # Otherwise, we try to switch to it.
    if [ -z "$2" ] ; then
      # If the first argument is a directory or a minus sign or
      # a non-zero integer use `cd`.
      if [[ -d "$1" || "$1" =~ '^(-|[+-][0-9]+)$' ]] ; then
        cd "$@"
        local exit_code="$?"
        if [ "$exit_code" -ne 0 ] ; then
          return "$exit_code"
        fi
      elif type z >/dev/null 2>&1 ; then
        z "$@"
        local exit_code="$?"
        if [ "$exit_code" -ne 0 ] ; then
          echo "\"$1\" could not be found."
          return "$exit_code"
        fi
        pwd
      fi
    fi

    if [ -n "$2" ] ; then
      local directory="$1"
    fi

  fi

  # Show the contents of the current directory.
  if type k >/dev/null 2>&1 ; then
    k --almost-all --human "$directory"
  else
    ls -AGp "$directory"
  fi
}

alias c.='c ..'
alias c..='c ..'
alias c.2='c ...'
alias c.3='c ....'
alias c.4='c .....'
alias c.5='c ......'
alias c/='c /'
alias c~='c ~'
alias c-='c -'
alias c.d='c ~/Downloads'
alias cs='c ~/Sites'

# See the contents of a directory without switching to it.
C() {
  c "$1" 1
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
