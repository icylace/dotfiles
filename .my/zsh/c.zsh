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
#     Yeah, probably.
#
# AUTHOR
#
#     Ron Martinez - ramartin.net@gmail.com
#
# SEE ALSO
#     The following are used if they are available:
#       - `bat`: https://github.com/sharkdp/bat
#       - `catimg`: https://github.com/posva/catimg
#       - `exa`: https://the.exa.website/
#       - `highlight`: http://andre-simon.de/doku/highlight/en/highlight.php
#       - `k`: https://github.com/rimraf/k
#       - `z`: https://github.com/rupa/z
#
# TODO:
# - view PDFs
# - appropriately handle other non-regular files
#   - socket
#   - block special
#   - character special
# - make use of command line switches
# - create a proper `man` page
# - use `hexyl` (with `hexdump` as fallback) to view general binaries and binary executables
# - make sure directory stack is properly managed when `z` and `cd` are used
# - make `highlight` options customizable
# - break it off from my dotfiles and open source it
# - add `ls -p` to `k`
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
  # TODO:
  # - make sure `cat` gets used if `highlight` doesn't work
  if [ -p /dev/stdin ] ; then
    highlight $highlight_options
    if [ "$?" -ne 0 ] ; then
      cat
    fi
    # cat
    return
  fi

  # If we're given an argument then we're probably not interested in looking at
  # the list for the current directory.
  if [ -n "$1" ] ; then

    # # https://stackoverflow.com/a/567787
    # if [ -x "$1" ] && [ $(file --brief --mime "$1" | grep --count --regexp='^text/') -eq 0 ] ; then
    #   echo "\"$1\" is a binary executable."
    #   return
    # fi

    # If we're given a regular file then view it.
    if [ -f "$1" ] ; then
      local mime=$(file --brief --mime "$1")

      local -i of_archive=$(echo $mime | grep --count --extended-regexp --regexp='\/(x-(gzip|rar|tar|zip)|zip);')
      if [ "$of_archive" -ne 0 ] ; then
        case "$1" in
          *.tar.gz) tar tvzf "$1" ;;
          *.rar)    unrar v "$1"  ;;
          *.tar)    tar tvf "$1"  ;;
          *.zip)    unzip -l "$1" ;;
          *)        echo "\"$1\" - unknown archive method" ;;
        esac
        return
      fi

      local -i of_image=$(echo $mime | grep --count --regexp='^image/')
      if [ "$of_image" -ne 0 ] ; then
        # Try to show the image in its real form.
        if [ "$TERM_PROGRAM" = 'iTerm.app' ] && type imgcat > /dev/null 2>&1 ; then
          imgcat "$@"
        # Otherwise, try to show the image in Unicode form.
        elif type catimg > /dev/null 2>&1 ; then
          catimg -l 0 "$@"
        fi
      # http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#index-commands
      # https://www.topbug.net/blog/2016/10/11/speed-test-check-the-existence-of-a-command-in-bash-and-zsh/
      elif (( ${+commands[bat]} )) ; then
        bat "$@"
      elif (( ${+commands[highlight]} )) ; then
        highlight $highlight_options "$@" | less --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --tabs=4
      else
        # Based on:
        # https://unix.stackexchange.com/a/86324
        # https://github.com/so-fancy/diff-so-fancy#usage
        less --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --tabs=4 "$@"
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

  # https://stackoverflow.com/a/3931779
  if (( ${+commands[exa]} )) ; then
    local l='exa --all --bytes --classify --color-scale --git --grid --group-directories-first --header --level=1 --long --modified --sort=name'
    if [ -n "$directory" ] ; then
      l "$directory"
    else
      l
    fi
  elif type k > /dev/null 2>&1 ; then
    k --almost-all --human "$directory"
  elif [ -n "$directory" ] ; then
    ls -AGlp "$directory"
  else
    ls -AGlp
  fi
}

# Similar to `c` but doesn't change directory.
C() {
  c "$1" 1
}

alias c.='c ..'
alias c.2='c ...'
alias c.3='c ....'
alias c.4='c .....'
alias c.5='c ......'
alias c~='c ~'
alias c-='c -'
alias c.d="c $HOME/Downloads"
alias cs="c $HOME/Sites"
