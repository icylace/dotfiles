#!/usr/bin/env bash

# yadm
# Yet Another Dotfiles Manager
# https://github.com/TheLocehiliosan/yadm
alias y='yadm status --untracked-files=no'
alias ya='yadm add'
alias yas='yadm list -a'
alias yay='yadm add --update && yadm commit -m "wip" && yadm push --set-upstream origin master'
alias yd='yadm diff --histogram --word-diff=color HEAD'
alias yd1='yadm diff --histogram --word-diff=color HEAD~1 HEAD'
alias yl='yadm log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias ypl='yadm pull --rebase=merges origin master'
