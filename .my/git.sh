#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Git
#  https://medium.com/@porteneuve/30-git-cli-options-you-should-know-about-15423e8771df
#  https://medium.com/@porteneuve/getting-solid-at-git-rebase-vs-merge-4fa1a48c53aa
# ------------------------------------------------------------------------------

# Setup.
alias git='hub'

gcl() {
  local repository=$1

  # Attempt to clone the repository and get it if it can't be done.
  git clone --verbose $repository
  if [ $? -ne 0 ] ; then
    return
  fi

  # Extract the project machine name from the repository URL.
  repository=${repository##*/}
  repository=${repository%.*}

  if type c >/dev/null 2>&1 ; then
    c $repository
  else
    cd $repository
  fi
}

# Info.
alias g='git status --branch --short'
alias gbc='git compare'
alias gbl='git blame --minimal --show-number --show-stats'
alias gg='git status --branch'
alias gll='git log --all --decorate --graph'
alias gll1='gll --oneline'
alias ggs='gg --untracked-files'
alias gsr='git symbolic-ref --short HEAD'
alias glo='gl origin/$(gsr)..$(gsr)'

# Difference comparison.
gd() {
  local commits=()

  for _ in $1 $2 ; do
    # http://stackoverflow.com/a/19116862/1935675
    if [ $1 -eq $1 ] 2>/dev/null && \
      # Handle the rare occurrence of a branch's
      # short SHA-1 hash containing only numbers.
      [ $1 -lt 1000 ]
    then
      commits+="HEAD~$1"
    else
      commits+=${1:-HEAD}
    fi
    shift
  done

  git diff --minimal --word-diff=color $@ ${commits[@]}
}
alias gd1='gd 1'
alias gd2='gd 2'
alias gds='gd --staged'

# Navigation.
gb() {
  if [ -n $1 ] ; then
    git checkout $1
  else
    git branch --all --verbose --verbose
  fi
}
alias gbd='git checkout dev'
alias gbm='git checkout master'

# Adding and updating.
gc() { git commit --verbose $2 ${1:+--message=\"$1\"} }
gc!() { gc $1 --amend }
gca() { gc $1 --all }
gr() { git rebase ${1:-master} }
alias ga='git add'
alias gal='git add --all'
alias gau='git add --update'
alias gap='git add --patch'
alias gba='git checkout -b'
alias gf='git fetch --all'
alias gm='git merge --no-ff'
alias gmf='git merge --ff-only'
alias gpl='git pull --rebase=preserve'
alias gpu='git push'
alias gplo='gpl origin'
alias gplr='git pull-request'
alias gpo='git push --set-upstream origin'
alias gre='git reset'

# Patching.
alias gdp='git diff --minimal HEAD'
alias gy='git apply --verbose'

# Stashing.
alias gsp='git stash pop --index'
alias gss='git stash save --include-untracked'

# Resetting and deleting.
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

setup_git_commands_that_pretty_print() {
  # https://drupalize.me/videos/moving-through-git-history?p=1173
  local pretty='--pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
  # local pretty='--pretty=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)"'
  # local pretty='--pretty=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)"'

  alias gl="git log --graph $pretty"
  alias gla="git log --all --graph $pretty"
  alias gld='git log --graph --minimal --patch-with-stat --word-diff=color $pretty'
  alias glad="git log --all --graph --minimal --patch-with-stat --word-diff=color $pretty"
  alias gs="git show $pretty"
  alias gsl="git stash list $pretty"
}
setup_git_commands_that_pretty_print
