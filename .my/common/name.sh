#!/usr/bin/env bash

# Checks if a potential a name for a new alias/function is taken already.
name() {
  # local brightRed='\e[1;31m'
  local blue='\e[0;34m'
  local reset='\e[0m'

  # local taken="${brightRed}Name is taken!${reset}"

  # type $1 > /dev/null 2>&1
  # if [ $? -eq 0 ] ; then
  #   echo $taken
  #   echo "${blue}type $1${reset}"
  #   echo $(type $1)
  #   return 1
  # fi

  # whence $1 > /dev/null 2>&1
  # if [ $? -eq 0 ] ; then
  #   echo $taken
  #   echo "${blue}whence $1${reset}"
  #   echo $(whence $1)
  #   return 1
  # fi

  # where $1 > /dev/null 2>&1
  # if [ $? -eq 0 ] ; then
  #   echo $taken
  #   echo "${blue}where $1${reset}"
  #   echo $(where $1)
  #   return 1
  # fi

  # which $1 > /dev/null 2>&1
  # if [ $? -eq 0 ] ; then
  #   echo $taken
  #   echo "${blue}which $1${reset}"
  #   echo $(which $1)
  #   return 1
  # fi

  # brew info $1 > /dev/null 2>&1
  # if [ $? -eq 0 ] ; then
  #   echo $taken
  #   echo "${blue}brew info $1${reset}"
  #   echo $(brew info $1)
  #   return 1
  # fi

  # brew cask info $1 > /dev/null 2>&1
  # if [ $? -eq 0 ] ; then
  #   echo $taken
  #   echo "${blue}brew cask info $1${reset}"
  #   echo $(brew cask info $1)
  #   return 1
  # fi

  # cargo search $1 > /dev/null 2>&1
  # if [ $? -eq 0 ] ; then
  #   echo $taken
  #   echo "${blue}cargo search $1${reset}"
  #   echo $(cargo search $1)
  #   return 1
  # fi

  # gem search $1 > /dev/null 2>&1
  # if [ $? -eq 0 ] ; then
  #   echo $taken
  #   echo "${blue}gem search $1${reset}"
  #   echo $(gem search $1)
  #   return 1
  # fi

  # echo Name is not taken.

  echo "${blue}type $1${reset}"
  type $1
  echo
  echo "${blue}whence $1${reset}"
  whence $1
  echo
  echo "${blue}where $1${reset}"
  where $1
  echo
  echo "${blue}which $1${reset}"
  which $1
  echo
  echo "${blue}brew info $1${reset}"
  brew info $1
  echo
  echo "${blue}brew cask info $1${reset}"
  brew cask info $1
  echo
  echo "${blue}cargo search $1${reset}"
  cargo search $1
  echo
  echo "${blue}gem search $1${reset}"
  gem search $1
}
