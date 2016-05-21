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
#     If no operand is given the contents of the current directory is shown.
#     If a directory is given switch to it and show its contents.
#     If a file is given show its contents.  Otherwise try to switch to a
#     "frecent" directory of a similar name to the given operand.
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
# - use `cat` when `highlight` doesn't work
# - use `cd` for arguments like "-1" and "+1"
# - consider using `vim -R` for viewing text files
#
c() {
  # If we're given a readble file then view it.
  if [ -f "$1" ] ; then
    local it_is_an_image=$(file --brief "$1" | grep --count --regexp=image)
    if [ "$it_is_an_image" -ne 0 ] ; then
      if type catimg >/dev/null 2>&1 ; then
        catimg -l 0 "$@"
      fi
    elif type highlight >/dev/null 2>&1 ; then
      local color_text=$(highlight --style=andes --out-format=xterm256 "$@")
      echo "$color_text" | less
    else
      cat "$@" | less
    fi
    return
  fi

  # If we're given only one argument and it's not a file then it must be a
  # directory so try to switch to it.
  if [ -n "$1" ] && [ -z "$2" ] ; then

    # TODO
    # - complete this
    #
    # # If the input begins with `-` or `+` followed by a number use `cd`.
    # local first_character=${word::1}
    # if [ $first_character = '-' ] ; then
    #   if [ following token is an integer ] ; then
    #     cd $@
    #   fi
    # fi

    if [ -d "$1" ] ; then
      cd "$@"
    elif type z >/dev/null 2>&1 ; then
      z "$@"
      if [ $? -ne 0 ] ; then
        echo "\"$1\" could not be found."
        return
      fi
      pwd
    fi
  fi

  if [ -n "$2" ] ; then
    local directory="$1"
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
alias c-='c -1'
alias c+='c +1'
alias c.d='c ~/Downloads'
alias cs='c ~/Sites'

# See the contents of a directory without switching to it.
C() {
  c "$1" 1
}

# ------------------------------------------------------------------------------

# Get info about a file or directory.
i() {
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
