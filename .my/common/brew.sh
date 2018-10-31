#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Homebrew
# ------------------------------------------------------------------------------

# https://github.com/Homebrew/brew/blob/master/docs/Analytics.md#opting-out
export HOMEBREW_NO_ANALYTICS=1

alias bl='brew list'
alias bd='brew doctor'
alias bdi='brew deps --installed'
alias bi='brew info'
alias bin='brew install'
alias bs='brew search'
alias bun='brew uninstall'

alias bcl='brew cask list'
alias bcd='brew cask doctor'
alias bci='brew cask info'
alias bcin='brew cask install'
alias bcun='brew cask uninstall'

# https://blog.jpalardy.com/posts/untangling-your-homebrew-dependencies/
# https://github.com/martido/brew-graph
alias bdg='brew graph --installed --highlight-leaves | fdp -Tpng -o/tmp/brew-graph.png ; open /tmp/brew-graph.png'
alias bdg2='brew graph --installed --highlight-leaves | dot -Tpng -o/tmp/brew-graph.png ; open /tmp/brew-graph.png'

# homebrew-rmtree
# Remove a formula and its unused dependencies
# https://github.com/beeftornado/homebrew-rmtree
alias brm='brew rmtree'

alias bu='brew update && brew upgrade && brew cleanup && brew cask cleanup'
