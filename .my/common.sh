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

# Be able to compare files with diff-so-fancy regardless
# of whether they're in a Git repository or not.
# Based on:
# https://superuser.com/a/1182284
dsf() { git diff --histogram --no-index --word-diff=color "$@" | diff-so-fancy | less --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --tabs=4 }

# This `dwdiff` is good for diffing files with long lines.
alias dwd='dwdiff --aggregate-changes --algorithm=best --color --line-numbers=2 --no-common'

alias li='ls -lAG'
alias o='open'

# http://askubuntu.com/a/332322
alias cp='cp -ip'

# Use Preview to read manual pages.
# https://discussions.apple.com/message/3541696#3541696
manp() { man -t $1 | open -f -a 'Preview' }

# Convert manual pages to PDFs.
# https://discussions.apple.com/message/3542050#3542050
manpdf() { man -t $1 | pstopdf -i -o $1.pdf }

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

# exa
# https://the.exa.website/
alias l='exa --all --binary --blocks --created --extended --git --group --group-directories-first --header --inode --level=2 --links --long --modified --tree'

# PostgreSQL
# https://www.postgresql.org/
# alias pg='postgres -D /usr/local/var/postgres'
alias pg='postgres'

# sift
# https://sift-tool.org/
alias s='sift --binary-skip --git --exclude-ext=dmg,pdf'
alias sn='sift --binary-skip --git --exclude-ext=dmg,pdf --exclude-dirs=node_modules --exclude-dirs=.npm'

# TODO
# - is this switch useful?
#   - `--exclude-files=.gitignore`

# yadm
# https://github.com/TheLocehiliosan/yadm
alias ya='yadm status --untracked-files=no'
alias yaa='yadm add'
alias yaau='yadm add --update'
alias yac='yadm commit -m'
alias yad='yadm diff --minimal --word-diff=color HEAD'
alias yad1='yadm diff --minimal --word-diff=color HEAD~1 HEAD'
alias yal='yadm log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias yapl='yadm pull --rebase=preserve origin master'
alias yapu='yadm push --set-upstream origin master'
alias yas='yadm list -a'
alias yay='yaau ; yac "WIP" ; yapu'

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
