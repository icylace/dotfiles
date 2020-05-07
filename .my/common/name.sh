#!/usr/bin/env bash

# TODO:
# - Is it possible to make this less overkill?

# Checks if a potential a name for a new alias/function is taken already.
name() {
  local error='\e[1;31m'
  local reset='\e[0m'
  local taken="${error}Name is taken!${reset}"

  type $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo type $1
    echo $(type $1)
    return 1
  fi

  whence $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo whence $1
    echo $(whence $1)
    return 1
  fi

  where $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo where $1
    echo $(where $1)
    return 1
  fi

  which $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo which $1
    echo $(which $1)
    return 1
  fi

  brew info $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo brew info $1
    echo $(brew info $1)
    return 1
  fi

  brew cask info $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo brew cask info $1
    echo $(brew cask info $1)
    return 1
  fi

  cargo search $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo cargo search $1
    echo $(cargo search $1)
    return 1
  fi

  echo Name is not taken.
}
