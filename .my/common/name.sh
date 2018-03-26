#!/usr/bin/env bash

# Check if a potential a name for a new alias/function is taken already.
# TODO: Possible to make it less overkill?
name() {
  local errorRed='\033[1;31m'
  local reset='\033[0m'

  # echo type

  type $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${errorRed}Name is taken!${reset}"
    return 1
  fi

  # echo whence

  whence $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${errorRed}Name is taken!${reset}"
    return 1
  fi

  # echo where

  where $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${errorRed}Name is taken!${reset}"
    return 1
  fi

  # echo which

  which $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${errorRed}Name is taken!${reset}"
    return 1
  fi

  # echo brew info

  brew info $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${errorRed}Name is taken!${reset}"
    return 1
  fi

  # echo brew cask info

  brew cask info $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "${errorRed}Name is taken!${reset}"
    return 1
  fi

  echo Name is not taken.
}
