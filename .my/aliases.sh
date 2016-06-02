#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Defines aliases and functions common to both Bash and Z shell.
# ------------------------------------------------------------------------------

alias li='ls -lAG'
alias o='open'

# http://askubuntu.com/a/332322
alias cp='cp -ip'

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

# Homebrew
alias b='brew info ; brew list'
alias bd='brew doctor'
alias bi='brew info'
alias bin='brew install'
alias bs='brew search'
alias bu='brew update && brew upgrade --all && brew cleanup && brew cask cleanup'
alias bun='brew install'

# Homebrew Cask
alias bk='brew cask list'
alias bkd='brew cask doctor'
alias bki='brew cask info'
alias bkin='brew cask install'
alias bks='brew cask search'
alias bkun='brew cask uninstall'

# Find files
# http://stackoverflow.com/a/4034907
alias f='find . -name'

# sift
alias s='sift --git'
alias sn='sift --git --exclude-dirs=node_modules --exclude-dirs=.npm'

# TODO
# - is this switch useful?
#   - `--exclude-files=.gitignore`

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
  if [ -p /dev/stdin ] ; then
    pbcopy
  else
    local file="$1"
    if [ -n "$file" ] ; then
      cat "$file" | pbcopy
    else
      pbpaste
    fi
  fi
}
