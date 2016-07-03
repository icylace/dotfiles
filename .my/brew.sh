#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Homebrew
# ------------------------------------------------------------------------------

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

alias bu='brew update && brew upgrade --all && brew cleanup && brew cask cleanup'
