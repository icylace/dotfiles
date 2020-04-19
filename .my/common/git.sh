#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Git
#  https://medium.com/@porteneuve/30-git-cli-options-you-should-know-about-15423e8771df
#  https://medium.com/@porteneuve/getting-solid-at-git-rebase-vs-merge-4fa1a48c53aa
# ------------------------------------------------------------------------------

# TODO:
# - create alias for making annotated tags
# - create alias for cherry picking

# Use `hub` (https://hub.github.com/) if available.
alias git='hub'

# Clones a Git repository.
gcl() {
  local repository=$1

  # Attempt to clone the repository.
  git clone --verbose "$repository"
  if [ $? -ne 0 ] ; then
    return
  fi

  # Extract the project machine name from the repository URL.
  repository=${repository##*/}
  repository=${repository%.*}

  # Go to the repository directory.
  if type c > /dev/null 2>&1 ; then
    c "$repository"
  else
    cd "$repository"
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

gd() {
  local commits=()
  for _ in $1 $2 ; do
    # https://stackoverflow.com/a/19116862
    if [ $1 -eq $1 ] 2>/dev/null && \
      # Handle the rare occurrence of a branch's
      # short SHA-1 hash containing only numbers.
      [ $1 -lt 1000 ]
    then
      # Views changes between the working and the latest commit.
      commits+=("HEAD~$1")
    else
      commits+=(${1:-HEAD})
    fi
    shift
  done
  git diff --histogram --word-diff=color $@ ${commits[@]}
}
alias gd1='gd 1'
alias gd2='gd 2'

# Views staged changes ready to commit.
alias gds='gd --staged'

# Views changes between the working tree and what's staged in the index.
gdd() { git diff --color $1 | diff-so-fancy }

# Compares files whether or not they're in a Git repository.
# Based on: https://superuser.com/a/1182284
gdf() {
  git diff --histogram --no-index --word-diff=color "$@" | diff-so-fancy | less --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --tabs=4
}

gb() {
  if [ -n "$1" ] ; then
    # Switch to a given branch.
    git checkout $1
  else
    # List all branches.
    git branch --all --verbose --verbose
  fi
}
# https://stackoverflow.com/a/2003515
# http://blogs.perl.org/users/mr_muskrat/2010/10/remove-a-git-tag-from-github-when-there-is-also-a-branch-of-the-same-name.html#comments
# http://www.markhneedham.com/blog/2013/06/13/git-having-a-branchtag-with-the-same-name-error-dst-refspec-matches-more-than-one/#comment-1178860178
# Deletes local branch.
gb-() {
  if [ -z "$1" ] ; then
    echo "Branch name required."
    return 1
  fi
  git branch --delete --force "refs/heads/$1"
}
# Deletes remote branch.
gb--() {
  if [ -z "$1" ] ; then
    echo "Branch name required."
    return 1
  fi
  git push origin --delete "refs/heads/$1"
}
alias gb+='git checkout -b'
alias gba='gb+'
alias gbm='git checkout master'
alias gtfo='gb-'
alias gtfo+='gb--'

# Adding.
alias ga='git add'
alias gal='git add --all'
alias gap='git add --patch'
alias gau='git add --update'

# Committing.
gc() { git commit --verbose $2 ${1:+--message="$1"} }

# Amends the last commit's timestamp to right now.
# https://github.com/maxjacobson/dotfiles/blob/dc66398f6f4a2a7d64a03bb59c360b2bd8c20ee9/bin/git-fib#L41
alias gcd='git commit --no-edit --amend --date="$(date -R)"'

alias gcn='git commit --amend'

alias gw='gal && gc "wip"'
alias gwu='gal && gc "wip" && gpu'

# gc-() {
#   # TODO:
#   # git revert
# }
gca() { gc $1 --all }

gr() { git rebase ${1:-master} }

# Reapplies commits on top of another commit based on user choices per commit.
alias gri='git rebase --interactive'

alias gf='git fetch --all --prune'

# https://coderwall.com/p/0kxphg/merging-branches-without-checkout
# Example: git fetch . develop:master
# or, using alias: gff develop:master
alias gff='git fetch .'

alias gm='git merge --no-ff'
alias gmf='git merge --ff-only'
alias gpl='git pull --rebase=merges'
alias gplo='gpl origin'
alias gplr='git pull-request'
alias gpo='git push --set-upstream origin'
alias gpu='git push --follow-tags'
alias grs='git reset'

# https://blog.frankel.ch/dont-git-push/
# http://weiqingtoh.github.io/force-with-lease/
alias gpuf='git push --force-with-lease'

# Patching.
alias gdp='git diff --minimal --no-color --no-pager HEAD'
alias gy='git apply --verbose'

# Stashing.
alias gsd='git stash drop'
alias gsp='git stash pop --index'
alias gss='git stash save --include-untracked'

# ------------------------------------------------------------------------------

# Tagging.
alias gt='git tag'
alias gta='git tag --annotate'
alias gtd='git tag --delete'

# https://stackoverflow.com/a/26366791
alias gtl='git tag -n99'

alias gtpu='git push origin --tags'

# ------------------------------------------------------------------------------

# Resetting and deleting.
# alias g-='git reset --'       # Unstage changes.
# alias gb-='git checkout --'
alias gtg='git reset --hard && git clean --force -d'
# https://stackoverflow.com/a/27415757
alias gtg+='gtg && git submodule deinit --force . && git submodule update --init'

setup_git_commands_that_pretty_print() {
  local log='git log --graph'
  local diff_log="$log --minimal --patch-with-stat --word-diff=color"

  # https://stackoverflow.com/a/9074343
  local pretty_short='--pretty=format:"%C(bold blue)%h -%Cgreen%d%Creset %C(white)%s %C(dim white)- %an %C(magenta)- %ar%Creset"'

  alias gl="$log $pretty_short"
  alias gla="$log $pretty_short --all"
  alias glad="$diff_log $pretty_short --all"
  alias gld="$diff_log $pretty_short"

  alias gsh="git show $pretty_short"

  alias gsl="git stash list $pretty_short"

  # https://stackoverflow.com/a/9074343
  local pretty_more='--pretty=format:"%C(bold blue)%h -%Cgreen%d%Creset %C(dim cyan)%aD %C(magenta)- %ar%Creset%n          %C(white)%s %C(dim white)- %an%Creset%n"'

  alias gl+="$log $pretty_more"
  alias gla+="$log $pretty_more --all"
  alias glad+="$diff_log $pretty_more --all"
  alias gld+="$diff_log $pretty_more"
}

setup_git_commands_that_pretty_print

# ------------------------------------------------------------------------------

# https://stackoverflow.com/questions/1286183/git-find-fat-commit#comment19133031_1557398
# https://github.com/sschuberth/dev-scripts/blob/master/git/git-commit-size.sh
git-commit-size() {
  if [ $# -ne 1 ] ; then
    echo "Rationale : Get the total size of all files added by the specified commit."
    echo "Usage     : git-commit-size <commit>"
    return 1
  fi

  blob_sizes=$(git diff-tree -r -c -M -C --no-commit-id $1 | grep " A " | cut -d " " -f 4 | git cat-file --batch-check | cut -d " " -f 3)
  total_size=0

  for size in $blob_sizes ; do
    let total_size+=size
  done

  if [ $total_size -gt 0 ] ; then
    total_size_kib=$(echo $total_size | awk '{printf "%.2f",$1/1024}')
    total_size_mib=$(echo $total_size_kib | awk '{printf "%.2f",$1/1024}')
    echo "The commit adds files totalling in $total_size bytes ($total_size_kib KiB, $total_size_mib MiB)."
  else
    echo "The commit does not add any files."
  fi
}

# ------------------------------------------------------------------------------

# https://mroth.github.io/scmpuff/
# https://github.com/mroth/scmpuff#setup
# https://github.com/mroth/scmpuff#can-i-disable-or-change-the-default-git-shortcut-aliases
eval "$(scmpuff init -s --aliases=false)"

alias gs='scmpuff_status'
