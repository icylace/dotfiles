#!/usr/bin/env zsh

#
# NAME
#     c - See the contents of a directory or file.
#
# SYNOPSIS
#     c [file] [-v|--only-view] [-r|--real-image]
#
# DESCRIPTION
#     If no input is given then it will list the contents of current the
#     directory.  Piped-in input and text file are are highlighted and
#     displayed.  Directories will get their contents listed.  Depending
#     upon the existence of a second argument the current directory is
#     switched to the one being looked at.
#
# OPTIONS
#
# BUGS
#
# AUTHOR
#
#     Ron Martinez - ramartin.net@gmail.com
#
# SEE ALSO
#     The following are used if they are installed:
#     - `catimg`: https://github.com/posva/catimg
#     - `highlight`: http://andre-simon.de/doku/highlight/en/highlight.php
#     - `k`: https://github.com/rimraf/k
#     - `z`: https://github.com/rupa/z
#
# TODO
# - use `hexdump -C` with `grc` to view general binaries and binary executables
# - appropriately handle other non-regular files
#   - socket
#   - block special
#   - character special
# - list the contents of archive files
# - command line switch instead of second argument
# - proper `man` page
# - make `highlight` options customizable
# - make better use `local` and/or `typeset`
# - break it off from my dotfiles and publicly open source it on my github
# - add `ls -p` to `k`
#
c() {
  local -a highlight_options=(
    --failsafe
    --line-numbers
    --quiet
    --style=andes
    --out-format=xterm256
  )

  # Input that's piped-in is highlighted and displayed.
  if [ -p /dev/stdin ] ; then
    highlight $highlight_options
    if [ "$?" -ne 0 ] ; then
      cat
    fi
    # cat
    return
  fi

  # If we're given an argument then that probably means we're not interested
  # in looking at the file list for the current directory.
  if [ -n "$1" ] ; then

    # # http://stackoverflow.com/a/567787/1935675
    # if [ -x "$1" ] && [ $(file --brief --mime "$1" | grep --count --regexp='^text/') -eq 0 ] ; then
    #   echo "\"$1\" is a binary executable."
    #   return
    # fi

    # If we're given a regular file then view it.
    if [ -f "$1" ] ; then
      local -i it_is_an_image=$(file --brief "$1" | grep --count --regexp=image)
      if [ "$it_is_an_image" -ne 0 ] ; then
        # Try to show the image in its real form.
        if [ "$TERM_PROGRAM" = 'iTerm.app' ] && type imgcat >/dev/null 2>&1 ; then
          imgcat "$@"
        # Otherwise, try to show the image in Unicode form.
        elif type catimg >/dev/null 2>&1 ; then
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
    if [ -n "$2" ] ; then
      local directory="$1"
    else
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

  fi

  # Show the contents of the current directory.
  if type k >/dev/null 2>&1 ; then
    k --almost-all --human "$directory" | sort
  else
    ls -AGp "$directory"
  fi
}

# See the contents of a directory without switching to it.
C() {
  c "$1" 1
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
