#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Defines aliases and functions common to both Bash and Z shell.
# ------------------------------------------------------------------------------

alias cp='cp -i'
alias li='ls -lAG'
alias o='open'

# Bower
alias bo='bower list'
alias boi='bower install'
alias bos='bower search'

# Drush
alias dr='drush'
alias drc='drush cache-clear all'
alias drcfu='drush cache-clear all && drush features-revert-all --yes && drush updatedb --yes'
alias drcr='drush cache-rebuild'
alias drd='drush pm-disable'
alias dre='drush pm-enable'
alias drf='drush features-revert-all --yes'
alias drff='drush features-revert-all --force --yes'
alias drfu='drush features-revert-all --yes && drush updatedb --yes'
alias drl='drush user-login'
alias drli='drush user-login --browser'
alias drlint='drush coder-review'
alias dru='drush updatedb --yes'
alias drun='drush pm-uninstall --yes'

# Use Preview to read man pages.
# http://brettterpstra.com/2014/08/05/shell-tricks-man-pages/
alias manp="man -t ${1} | open -f -a Preview"

# https://github.com/yrammos/dotfiles/blob/master/.bashrc
alias mv='mv -i'

# http://www.techrepublic.com/blog/10things/cut-down-on-linux-command-line-typing-with-these-10-handy-bash-aliases/352
alias df='df -h'

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md#safeguard-rm
alias rm='rm -i'

# Get current IP address.
alias myip='curl icanhazip.com'

# http://kvz.io/blog/2012/10/03/quick-server-debugging-with-wtf/
alias wtf='tail -f /var/log/{dmesg,messages,*{,/*}{log,err}}'

# # https://tutsplus.com/forums/topic/handy-aliasses-for-opening-sublimetext-with-xiki-buffer/
# # OPEN UP XIKI SUBLIME TEXT 2
# alias stx='subl . ; subl *.xiki'
# # Create Xiki buffer from terminal.
# alias xiki='pwd > tree.xiki'


# ------------------------------------------------------------------------------
#  Git
#  https://drupalize.me/videos/moving-through-git-history?p=1173
#  https://medium.com/@porteneuve/30-git-cli-options-you-should-know-about-15423e8771df
#  https://medium.com/@porteneuve/getting-solid-at-git-rebase-vs-merge-4fa1a48c53aa
# ------------------------------------------------------------------------------

# Setup
alias git='hub'
# TODO
# - improve gcl so it switches into the repo directory after cloning
alias gcl='git clone --verbose'

# Info
alias g='git status --branch --short'
alias gbc='git compare'
alias gbl='git blame --minimal --show-number --show-stats'
alias gd1='git diff --minimal --word-diff=color HEAD~1 HEAD'
alias gd2='git diff --minimal --word-diff=color HEAD~2 HEAD'
alias gg='git status --branch'
alias ggs='git status --branch --untracked-files'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias gld='gl --patch-with-stat --minimal --word-diff=color'
alias gll='git log --decorate --graph --all'
alias gll1='git log --decorate --graph --all --oneline'
alias gs='git show --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias gsr='git symbolic-ref --short HEAD'
alias glo='gl origin/$(gsr)..$(gsr)'
gd() {
  if [ -n "$1" ] ; then
    git diff --minimal --word-diff=color "$1"
  else
    git diff --minimal --word-diff=color HEAD
  fi
}
gds() {
  if [ -n "$1" ] ; then
    git diff --minimal --staged --word-diff=color "$1"
  else
    git diff --minimal --staged --word-diff=color HEAD
  fi
}

# Navigating
alias gbd='git checkout dev'
alias gbm='git checkout master'
gb() {
  if [ -n "$1" ] ; then
    git checkout "$1"
  else
    git branch --all --verbose --verbose
  fi
}

# Adding and updating
alias ga='git add'
alias gal='git add --all'
alias gau='git add --update'
alias gap='git add --patch'
alias gba='git checkout -b'
alias gf='git fetch --all'
alias gm='git merge --no-ff'
alias gmf='git merge --ff-only'
alias gpu='git push'
alias gpl='git pull --rebase=preserve'
alias gplo='git pull --rebase=preserve origin'
alias gplr='git pull-request'
alias gpo='git push --set-upstream origin'
alias gre='git reset'
gc() {
  if [ -n "$1" ] ; then
    git commit --verbose -m "$1"
  else
    git commit --verbose
  fi
}
gr() {
  if [ -n "$1" ] ; then
    git rebase "$1"
  else
    git rebase master
  fi
}

# Patching
alias gdp='git diff --minimal HEAD'
alias gy='git apply --verbose'

# Stashing
alias gsl='git stash list --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias gss='git stash save --include-untracked'
alias gsp='git stash pop --index'

# Resetting and deleting
# alias g-='git reset --'
# alias gb-='git checkout --'
alias gtg='git reset --hard ; git clean --force -d'
# alias gtfo='git reset --hard ; git clean --force -d'
# http://stackoverflow.com/a/27415757
alias gtg+='gtg ; git submodule deinit --force . ; git submodule update --init'
# alias gtfo+='gtfo ; git submodule deinit --force . ; git submodule update --init'
# http://stackoverflow.com/a/2003515
# alias gb-= # delete local branch
# alias gb--= # delete remote branch
alias gtfo='git branch --delete --force'
alias gtfo+='git push origin --delete'
# alias gtfo='gb- ; gb--'

# ------------------------------------------------------------------------------

# Haskell
alias h='ghc -package-db=.cabal-sandbox/x86_64-osx-ghc-7.6.3-packages.conf.d'
alias hc='cabal'
alias hcs='cabal sandbox'
alias hi='ghci -package-db=.cabal-sandbox/x86_64-osx-ghc-7.6.3-packages.conf.d'
alias hr='runghc -package-db=.cabal-sandbox/x86_64-osx-ghc-7.6.3-packages.conf.d'

# Homebrew
alias b='brew info ; brew list'
alias bd='brew doctor'
alias bi='brew info'
alias bs='brew search'
alias bu='brew update && brew upgrade --all && brew cleanup && brew cask cleanup'

# Homebrew Cask
alias bk='brew cask list'
alias bkd='brew cask doctor'
alias bki='brew cask info'
alias bks='brew cask search'

# Find files
# http://stackoverflow.com/a/4034907
alias f='find . -name'

# sift
alias s='sift'
alias sn='sift --git --exclude-dirs=node_modules --exclude-dirs=.npm'

# --exclude-files=.gitignore

# Symfony
alias sr='php app/console server:run'

# Vagrant
alias v='vagrant status'
alias vbl='vagrant box list'
alias vbr='vagrant box remove'
alias vd='vagrant destroy'
alias vd1='vagrant destroy --force $(vagrant global-status --prune | tail -n+3 | head -n1 | cut -c1-7)'
alias vg='vagrant global-status --prune'
alias vh='vagrant halt'
alias vp='vagrant provision'
alias vs='vagrant ssh'
alias vu='vagrant up'
alias vdu='vd1 && vu'

# yadm
# https://github.com/TheLocehiliosan/yadm
alias y='yadm status --untracked-files=no'
alias ya='yadm add'
alias yau='yadm add --update'
alias yc='yadm commit -m'
alias yd='yadm diff --minimal --word-diff=color HEAD'
alias yd1='yadm diff --minimal --word-diff=color HEAD~1 HEAD'
alias yl='yadm log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias ypl='yadm pull --rebase=preserve origin master'
alias ypu='yadm push --set-upstream origin master'
alias ys='yadm list -a'
alias yy='yau ; yc "WIP" ; ypu'

#
# Pipes in/out of the OS X clipboard.
#
# Usage: <command> | cb     # Copy stdin.
#        cb <file>          # Copy a file's contents.
#        cb | <command>     # Pipe clipboard's content into a command.
#        cb > <file>        # Paste into a file.
#
# Based on:
# http://stackoverflow.com/a/19458217
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/clipboard.zsh
#
cb() {
  if [[ -p /dev/stdin ]] ; then
    pbcopy
  else
    local file="$1"
    if [[ -n "$file" ]] ; then
      cat "$file" | pbcopy
    else
      pbpaste
    fi
  fi
}

# Swift
sw() {
  if [ -f "$1" ] ; then
    # echo ${1//\\/\\\\}
    swift "$1"
  elif [ -f "$1".swift ] ; then
    swift "$1".swift
  else
    echo 'Not a Swift file.'
  fi
}