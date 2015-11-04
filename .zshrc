# http://superuser.com/questions/187639/zsh-not-hitting-profile/187673#187673
if [ -f ~/.profile ]; then
  emulate sh -c 'source ~/.profile'
fi

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Tell Z Shell to not try to autocorrect the following.
# http://superuser.com/questions/251818/exceptions-to-zsh-correctall-feature/271897#271897
alias bower='nocorrect bower'
alias composer='nocorrect composer'
alias drush='nocorrect drush'
alias npm='nocorrect npm'

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# ------------------------------------------------------------------------------

# https://github.com/tarjoilija/zgen#automatically-check-for-filechanges-and-regenerate-zinit
export ZGEN_RESET_ON_CHANGE="${HOME}/.zshrc"

# export ZSH_THEME="bira"

# zgen
# A lightweight plugin manager for ZSH inspired by Antigen.
# https://github.com/tarjoilija/zgen
# https://github.com/unixorn/zsh-quickstart-kit/blob/master/zsh/.zgen-setup
if [ ! -f "${HOME}/zgen/zgen.zsh" ]; then
  git clone git@github.com:tarjoilija/zgen.git "${HOME}/zgen"
fi

source "${HOME}/zgen/zgen.zsh"

if ! zgen saved; then
  echo 'Creating a zgen init script.'

  zgen oh-my-zsh

  # alias-tips
  # Reminds you of aliases you have already.
  # https://github.com/djui/alias-tips
  zgen load djui/alias-tips

  # k
  # Directory listings for zsh with git features.
  # https://github.com/rimraf/k
  zgen load rimraf/k

  # z
  # Navigate your most used directories based on 'frecency'.
  # https://github.com/rupa/z
  zgen load rupa/z

  # TODO
  # - create a custom theme
  # zgen oh-my-zsh themes/bira
  # zgen oh-my-zsh themes/amuse

  zgen save
fi

# ------------------------------------------------------------------------------

#
# Based on:
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# http://blog.munge.net/fun-with-zsh-themes/
# http://justin.jetfive.com/2012/12/01/my-new-zsh-theme.html
#

battery_charge() {
  python "${HOME}/My/Shell/battery_charge.py" --color
}

show_prompt() {
  # git branch >/dev/null 2>/dev/null && echo '±' && return
  # local prompt_char='♿'
  # local prompt_char='❆'
  # local prompt_char='⑁'
  # local prompt_char='২'
  # local prompt_char='⁘'
  # local prompt_char='৶'
  # local prompt_char='९'
  # local prompt_char='﷽'
  # local prompt_char='ઑ'
  # local prompt_char='☙'
  # local prompt_char='♞'
  local prompt_char='♘'
  echo "%{$fg_bold[magenta]%}$prompt_char %{$reset_color%}"
}

export GIT_RADAR_COLOR_BRANCH="%{$fg_bold[cyan]%}"
export GIT_RADAR_FORMAT="on %{branch}%{  :remote}%{  :local}%{  :changes}"

git_stash_status_zsh() {
  git branch >/dev/null 2>/dev/null || return
  # https://lists.gnu.org/archive/html/bug-coreutils/2008-01/msg00123.html
  local number_stashes="$(echo $(git stash list | wc -l))"
  if [[ $number_stashes -gt 0 ]]; then
    printf %s " $number_stashes%{$fg_bold[white]%}ॾ%{$reset_color%}"
  fi
}

# local return_char='✘'
# local return_char='⏎'
# local return_char='↵'
local return_status="%{$fg[red]%}%(?.. ∙%?∙)%{$reset_color%}"

export PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} \
at %{$fg[yellow]%}%m%{$reset_color%} \
in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} \
$(git-radar --zsh --fetch)$(git_stash_status_zsh)
$(show_prompt)${return_status} '

# Display the date and battery charge.
export RPROMPT='$(battery_charge)  %D{%Y ∴ %m-%d ∴ %L:%M:%S %p}'

# TODO
# - check if TMOUT will prematurely terminate scripts that wait for input
#   - http://www.thegeekstuff.com/2010/05/tmout-exit-bash-shell-when-no-activity/#comment-46144
#   - http://h30499.www3.hp.com/t5/Languages-and-Scripting/TMOUT-cause-scripts-end/m-p/5249728#M40881
#   - http://h30499.www3.hp.com/t5/Languages-and-Scripting/TMOUT-cause-scripts-end/m-p/5249732#M40885
TMOUT=1

TRAPALRM() {
  zle reset-prompt
}

# ------------------------------------------------------------------------------

#
# Batch Zip
#
# Based on:
# http://hints.macworld.com/article.php?story=20070803053156346
# http://www.macworld.com/article/1134810/zipmany.html
# http://alexsantidote.com/334/batch-zip-and-rename/
# http://askubuntu.com/questions/360063/how-to-show-a-running-clock-in-terminal-before-the-command-prompt/360172#360172
#
bz() {
  for f in "$@"; do
    # Check that the file exists and that it's not in fact a directory.
    if [[ -e "$f" && ! (-d "$f") ]]; then
      zip --junk-paths -9 "${f%.*}.zip" "$f"
      mv "$f" ~/.Trash
    fi
  done
}

# ------------------------------------------------------------------------------

#
# NAME
#     c - See the contents of a directory or file.
#
# SYNOPSIS
#     c [file]
#
# DESCRIPTION
#     If no operand is given the contents of the current directory is shown.
#     If a directory is given switch to it and show its contents.
#     If a file is given show its contents.  Otherwise try to switch to a
#     "frecent" directory of a similar name to the given operand.
#
# NOTES
#     The original reason why I made this was because I usually want to see
#     immediately the contents of a directory I switch to.
#
#     Executing 'cd' with no arguments changes to the home directory but I have
#     `c` simply list the current directory in that case.
#
#     `k` (https://github.com/rimraf/k) will be used if it is installed.
#     `z` (https://github.com/rupa/z) will be used if it is installed.
#
# TODO
# - use catimg (if it exists) if $1 appears to be an image
# - use pygmentize (if it exists) for syntax highlighting but only for appropriate files
# - use `cd` for arguments like "-1" and "+1"
#
c() {
  # If we're given a file view it.
  if [ -f "$1" ]; then
    cat $@ | less
    return
  fi

  # If we're given something and it's not a file then it must be a
  # directory so try to switch to it.
  if [ -n "$1" ]; then
    if [ -d "$1" ]; then
      cd $@
    elif type z >/dev/null 2>&1; then
      z $@
      if [ $? -ne 0 ]; then
        echo "\"$1\" could not be found."
        return
      fi
      pwd
    fi
  fi

  # Show the contents of the current directory.
  if type k >/dev/null 2>&1; then
    k --almost-all --human
  else
    ls -AGp
  fi
}

alias c.='c ..'
alias c..='c ..'
alias c.2='c ...'
alias c.3='c ....'
alias c.4='c .....'
alias c.5='c ......'
alias c/='c /'
alias c~='c ~'
alias c-='c -1'
alias c+='c +1'
alias c.d='c ~/Downloads'
alias cs='c ~/Sites'

# ------------------------------------------------------------------------------

# Manually update things.
u() {
  upgrade_oh_my_zsh
  # antigen update
  zgen selfupdate
  zgen update
  npm update -g
  gem update
  pip install --upgrade pip setuptools
  pip-review --auto
  # Update Homebrew stuff by using our alias.
  bu
}

# ------------------------------------------------------------------------------

#
# Simple setup for a new Laravel project. This will do most of the setup.
#
# Usage:
#
#   1. `cd` to the folder that will contain the project folder.
#
#   2. `laravel-basis {NameOfApp}`
#      Note:  Make sure there's no subfolder named `{NameOfApp}` already.
#
#   3. Adjust "app/config/local/database.php" and
#      "app/config/local/mail.php" accordingly.
#
#   4. Edit the environment detection in "bootstrap/start.php" with this:
#
#        $env = $app->detectEnvironment(function () {
#          return getenv('LARAVEL_ENV') ?: 'local';
#        });
#
# Notes:
#
#   - Eventually when certain files get created it's useful to make them
#     writable for development.
#
#        sudo chmod -R 777 app/storage/logs/laravel.log
#        sudo chmod -R 777 app/storage/meta/services.json
#
laravel-setup() {
  laravel new $1
  cd $1
  chmod -R 777 app/storage
  sed -i '' "s/your-machine-name/$(hostname)/g" bootstrap/start.php
  cp app/config/database.php app/config/local/database.php
  cp app/config/mail.php app/config/local/mail.php
  php artisan key:generate
}

# ------------------------------------------------------------------------------

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -f ~/.extra ]; then
  source ~/.extra
fi

# zsh-syntax-highlighting
# Provides syntax highlighting of commands as they are typed at the prompt.
# https://github.com/zsh-users/zsh-syntax-highlighting
# TODO
# - get this working

# export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# source /Users/ronmartinez/.zgen/zsh-users/zsh-syntax-highlighting-master/highlighters/main/main-highlighter.zsh
# source /Users/ronmartinez/.zgen/zsh-users/zsh-syntax-highlighting-master/zsh-syntax-highlighting.zsh
