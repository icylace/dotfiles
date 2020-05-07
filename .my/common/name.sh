#!/usr/bin/env bash

# Checks if a potential a name for a new alias/function is taken already.
name() {
  local blue='\e[0;34m'
  local reset='\e[0m'

  echo "${blue}type $1${reset}"
  type $1

  echo "${blue}whence $1${reset}"
  echo $(whence $1)

  echo "${blue}where $1${reset}"
  echo $(where $1)

  echo "${blue}which $1${reset}"
  echo $(which $1)

  echo "${blue}brew info $1${reset}"
  echo $(brew info $1)

  echo "${blue}brew cask info $1${reset}"
  echo $(brew cask info $1)

  echo "${blue}cargo search $1${reset}"
  echo $(cargo search $1)

  echo "${blue}gem search $1${reset}"
  echo $(gem search $1)
}
