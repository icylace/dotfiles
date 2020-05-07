#!/usr/bin/env bash

# TODO:
# - Is it possible to make this less overkill?

# Checks if a potential a name for a new alias/function is taken already.
name() {
  local brightRed='\e[1;31m'
  local blue='\e[0;34m'
  local reset='\e[0m'

  local taken="${brightRed}Name is taken!${reset}"

  type $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo "${blue}type $1${reset}"
    echo $(type $1)
    return 1
  fi

  whence $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo "${blue}whence $1${reset}"
    echo $(whence $1)
    return 1
  fi

  where $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo "${blue}where $1${reset}"
    echo $(where $1)
    return 1
  fi

  which $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo "${blue}which $1${reset}"
    echo $(which $1)
    return 1
  fi

  brew info $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo "${blue}brew info $1${reset}"
    echo $(brew info $1)
    return 1
  fi

  brew cask info $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo "${blue}brew cask info $1${reset}"
    echo $(brew cask info $1)
    return 1
  fi

  cargo search $1 > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo $taken
    echo cargo search $1
    echo "${blue}cargo search $1${reset}"
    echo $(cargo search $1)
    return 1
  fi

  echo Name is not taken.
}
