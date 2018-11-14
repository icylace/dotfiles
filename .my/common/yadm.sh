#!/usr/bin/env bash

# yadm
# https://github.com/TheLocehiliosan/yadm
alias ya='yadm status --untracked-files=no'
alias yaa='yadm add'
alias yad='yadm diff --histogram --word-diff=color HEAD'
alias yad1='yadm diff --histogram --word-diff=color HEAD~1 HEAD'
alias yal='yadm log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias yap='yadm pull --rebase=preserve origin master'
alias yas='yadm list -a'
alias yay='yadm add --update && yadm commit -m "WIP" && yadm push --set-upstream origin master'

# I use `yadm` to manage my dotfiles:
# https://github.com/icylace/dotfiles
