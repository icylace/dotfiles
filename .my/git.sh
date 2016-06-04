#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Git
#  https://drupalize.me/videos/moving-through-git-history?p=1173
#  https://medium.com/@porteneuve/30-git-cli-options-you-should-know-about-15423e8771df
#  https://medium.com/@porteneuve/getting-solid-at-git-rebase-vs-merge-4fa1a48c53aa
# ------------------------------------------------------------------------------

# Setup
alias git='hub'
# TODO
# - improve gcl so it switches into the repo directory after successful cloning
alias gcl='git clone --verbose'

# Info
alias g='git status --branch --short'
alias gbc='git compare'
alias gbl='git blame --minimal --show-number --show-stats'
alias gg='git status --branch'
alias ggs='gg --untracked-files'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias gld='gl --minimal --patch-with-stat --word-diff=color'
alias gll='git log --decorate --graph --all'
alias gll1='gll --oneline'
alias gs='git show --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias gsr='git symbolic-ref --short HEAD'
alias glo='gl origin/$(gsr)..$(gsr)'

# Info - Comparing differences
gd() {
  local cur_commit
  local prev_commit

  # http://stackoverflow.com/a/19116862/1935675
  if [ $1 -eq $1 ] 2>/dev/null ; then
    cur_commit='HEAD'
    prev_commit="HEAD~$1"
  else
    cur_commit=${1:-HEAD}
  fi

  git diff --minimal --word-diff=color $prev_commit $cur_commit
}
gds() {
  local cur_commit

  # http://stackoverflow.com/a/19116862/1935675
  if [ $1 -eq $1 ] 2>/dev/null ; then
    cur_commit="HEAD~$1"
  else
    cur_commit=${1:-HEAD}
  fi

  git diff --minimal --staged --word-diff=color $cur_commit
}

# Navigating
alias gbd='git checkout dev'
alias gbm='git checkout master'
gb() {
  if [ -n $1 ] ; then
    git checkout $1
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
alias gplo='gpl origin'
alias gplr='git pull-request'
alias gpo='git push --set-upstream origin'
alias gre='git reset'
gc() { git commit --verbose $2 ${1:+--message=\"$1\"} }
gc!() { gc $1 --amend }
gca() { gc $1 --all }
gr() { git rebase ${1:-master} }

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
