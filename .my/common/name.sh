#!/usr/bin/env bash

# Check if a potential a name for a new alias/function is taken already.
# TODO: Possible to make it less overkill?
name() {
  local error='\033[1;31m'
  local reset='\033[0m'

  type $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${error}Name is taken!${reset}"
    echo type $1
    return 1
  fi

  whence $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${error}Name is taken!${reset}"
    echo whence $1
    return 1
  fi

  where $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${error}Name is taken!${reset}"
    echo where $1
    return 1
  fi

  which $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${error}Name is taken!${reset}"
    echo which $1
    return 1
  fi

  brew info $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${error}Name is taken!${reset}"
    echo brew info $1
    return 1
  fi

  brew cask info $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${error}Name is taken!${reset}"
    echo brew cask info $1
    return 1
  fi

  echo Name is not taken.
}
