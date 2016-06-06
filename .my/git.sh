#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Git
#  https://medium.com/@porteneuve/30-git-cli-options-you-should-know-about-15423e8771df
#  https://medium.com/@porteneuve/getting-solid-at-git-rebase-vs-merge-4fa1a48c53aa
# ------------------------------------------------------------------------------

# TODO
# - create alias for making annotated tags
# - create alias for cherry picking

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

  # Go to the repository directory.
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
alias ggs='gg --untracked-files'
alias gll='git log --all --decorate --graph'
alias gll1='gll --oneline'
alias glo='gl origin/$(gsr)..$(gsr)'
alias gsr='git symbolic-ref --short HEAD'

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
  if [ $1 ] ; then
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
gc-() {
  # TODO
  # git revert
}
gca() { gc $1 --all }
gr() { git rebase ${1:-master} }
alias ga='git add'
alias gal='git add --all'
alias gap='git add --patch'
alias gau='git add --update'
alias gba='git checkout -b'
alias gf='git fetch --all --prune'
alias gm='git merge --no-ff'
alias gmf='git merge --ff-only'
alias gpl='git pull --rebase=preserve'
alias gplo='gpl origin'
alias gplr='git pull-request'
alias gpo='git push --set-upstream origin'
alias gpu='git push --follow-tags'
alias gre='git reset'

# Patching.
alias gdp='git diff --minimal HEAD'
alias gy='git apply --verbose'

# Stashing.
alias gsp='git stash pop --index'
alias gss='git stash save --include-untracked'

# Resetting and deleting.
# alias g-='git reset --'       # Unstage changes.
# alias gb-='git checkout --'
alias gtg='git reset --hard && git clean --force -d'
# http://stackoverflow.com/a/27415757/1935675
alias gtg+='gtg && git submodule deinit --force . && git submodule update --init'
# http://stackoverflow.com/a/2003515/1935675
alias gtfo='git branch --delete --force'        # Delete local branch.
alias gtfo+='git push origin --delete'          # Delete remote branch.

setup_git_commands_that_pretty_print() {
  local log='git log --graph'
  local diff_log="$log --minimal --patch-with-stat --word-diff=color"

  # http://stackoverflow.com/a/9074343/1935675
  local pretty_short='--pretty=format:"%C(bold blue)%h -%Cgreen%d%Creset %C(white)%s %C(dim white)- %an %C(magenta)- %ar%Creset"'

  alias gl="$log $pretty_short"
  alias gla="$log $pretty_short --all"
  alias glad="$diff_log $pretty_short --all"
  alias gld="$diff_log $pretty_short"

  alias gs="git show $pretty_short"

  alias gsl="git stash list $pretty_short"

  # http://stackoverflow.com/a/9074343/1935675
  local pretty_more='--pretty=format:"%C(bold blue)%h -%Cgreen%d%Creset %C(dim cyan)%aD %C(magenta)- %ar%Creset%n          %C(white)%s %C(dim white)- %an%Creset%n"'

  alias gl+="$log $pretty_more"
  alias gla+="$log $pretty_more --all"
  alias glad+="$diff_log $pretty_more --all"
  alias gld+="$diff_log $pretty_more"
}
setup_git_commands_that_pretty_print
