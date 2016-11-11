#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Homebrew
# ------------------------------------------------------------------------------

# https://github.com/Homebrew/brew/blob/master/docs/Analytics.md#opting-out
export HOMEBREW_NO_ANALYTICS=1

alias b='brew info ; brew list'
alias bd='brew doctor'
alias bi='brew info'
alias bin='brew install'
alias bs='brew search'
alias bun='brew uninstall'

alias bk='brew cask list'
alias bkd='brew cask doctor'
alias bki='brew cask info'
alias bkin='brew cask install'
alias bks='brew cask search'
alias bkun='brew cask uninstall'

alias bu='brew update && brew upgrade && brew cleanup && brew cask cleanup'
