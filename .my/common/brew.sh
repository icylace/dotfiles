#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Homebrew
# ------------------------------------------------------------------------------

# https://github.com/Homebrew/brew/blob/master/docs/Analytics.md#opting-out
export HOMEBREW_NO_ANALYTICS=1

alias bl='brew list'
alias bd='brew doctor'
alias bi='brew info'
alias bin='brew install'
alias bs='brew search'
alias bun='brew uninstall'

alias bcl='brew cask list'
alias bcd='brew cask doctor'
alias bci='brew cask info'
alias bcin='brew cask install'
alias bcun='brew cask uninstall'

alias bu='brew update && brew upgrade && brew cleanup && brew cask cleanup'
