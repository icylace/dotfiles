#!/usr/bin/env bash

source "$HOME/.my/appledev.sh"
source "$HOME/.my/brew.sh"
source "$HOME/.my/bz.sh"
source "$HOME/.my/git.sh"
source "$HOME/.my/u.sh"
source "$HOME/.my/url-directories.sh"
source "$HOME/.my/webdev.sh"


# ------------------------------------------------------------------------------
#  Defines aliases and functions common to both Bash and Z shell.
# ------------------------------------------------------------------------------

alias li='ls -lAG'
alias o='open'

# http://askubuntu.com/a/332322
alias cp='cp -ip'

# Use Preview to read manual pages.
# https://discussions.apple.com/message/3541696#3541696
manp() {
  man -t $1 | open -f -a 'Preview'
}

# Convert manual pages to PDFs.
# https://discussions.apple.com/message/3542050#3542050
manpdf() {
  man -t $1 | pstopdf -i -o $1.pdf
}

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

# Find files
# http://stackoverflow.com/a/4034907
alias f='find . -name'

# sift
alias s='sift --git'
alias sn='sift --git --exclude-dirs=node_modules --exclude-dirs=.npm'

# TODO
# - is this switch useful?
#   - `--exclude-files=.gitignore`

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
