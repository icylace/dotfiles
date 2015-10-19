# http://superuser.com/questions/187639/zsh-not-hitting-profile/187673#187673
if [ -f ~/.profile ]; then
  emulate sh -c 'source ~/.profile'
fi

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Tell Z Shell to not try to autocorrect the following.
# Based on:
# http://superuser.com/questions/251818/exceptions-to-zsh-correctall-feature/271897#271897
alias bower='nocorrect bower'
alias composer='nocorrect composer'
alias drush='nocorrect drush'
alias npm='nocorrect npm'

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# ------------------------------------------------------------------------------

# https://github.com/mikl/dotfiles/blob/master/zshrc

# Use Antigen if installed.
# https://github.com/zsh-users/antigen
if [ -f ~/.antigen/antigen.zsh ]; then
  source ~/.antigen/antigen.zsh

  antigen use oh-my-zsh

  # # http://mgdm.net/weblog/zsh-antigen/
  # if [ "$OSTYPE"="darwin11.0" ]; then
  #   antigen bundle osx
  # fi

  # antigen bundle git
  # antigen bundle github

  # Autocompletion for your Gulp tasks.
  antigen bundle akoenig/gulp-autocompletion-zsh

  # antigen bundle djui/alias-tips
  # antigen bundle Tarrasch/zsh-functional

  # Navigate your most used directories based on 'frecency'.
  antigen bundle rupa/z

  # Directory listings for zsh with git features.
  antigen bundle rimraf/k

  # A dark theme.
  antigen theme bira

  antigen apply
fi

# ------------------------------------------------------------------------------

#
# Based on:
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# http://blog.munge.net/fun-with-zsh-themes/
#

battery_charge() {
  python ~/My/Shell/battery_charge.py --color
}

prompt_char() {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  # echo '♿'
  # echo '❆'
  # echo '⑁'
  # echo '২'
  # echo '͓'
  # echo '⁘'
  # echo '৶'
  echo '९'
}

vcprompt_info() {
  # vcprompt
  # https://bitbucket.org/gward/vcprompt
  # installed via brew

  vcprompt -f 'on %b %u%m'

  # Format strings use printf-like "%" escape sequences:
  #
  #   %n  name of the VC system managing the current directory
  #       (e.g. "cvs", "hg", "git", "svn")
  #   %b  current branch name
  #   %r  current revision
  #   %u  ? if there are any unknown files
  #   %m  + if there are any uncommitted changes (added, modified, or
  #       removed files)
  #   %%  a single % character

  # vcprompt -f "on %{$fg[magenta]%}%b%{$reset_color%}%{$fg[green]%}%u%m%a%{$reset_color%}"

  # vcprompt \
  #   --format-git "on %{$fg[magenta]%}%b%{$reset_color%}%{$fg[green]%}%u%m%a%{$reset_color%}" \
  #   --format     "on %s %{$fg[magenta]%}%b%{$reset_color%}%{$fg[green]%}%u%m%{$reset_color%}"
}

virtualenv_info() {
  [ $VIRTUAL_ENV ] && echo '('$(basename $VIRTUAL_ENV)') '
}

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"

# $(git_prompt_info)

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} \
at %{$fg[yellow]%}%m%{$reset_color%} \
in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} \
$(vcprompt_info)
$(virtualenv_info)$(prompt_char)${return_status} '

# http://justin.jetfive.com/2012/12/01/my-new-zsh-theme.html

# Display the date and battery charge.
RPROMPT='$(battery_charge)  $(date "+%Y ∴ %m∙%d ∴ %l:%M %p")'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# ------------------------------------------------------------------------------

# drupal-setup() {
#   mkdir $1
#   cd $1
#   drush dl drupal-7.x
#   drush site-install standard --account-name=superuser --account-pass=password --db-url=mysql://root:clever-password@localhost/drupal_site
# }

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

#
# Based on:
# http://hints.macworld.com/article.php?story=20070803053156346
# http://www.macworld.com/article/1134810/zipmany.html
# http://alexsantidote.com/334/batch-zip-and-rename/
#
batch-zip() {
  for f in "$@"; do
    # Check that the file exists and that it's not in fact a directory.
    if [[ -e "$f" && ! (-d "$f") ]]; then
      zip -j -9 "${f%.*}.zip" "$f"
      mv "$f" ~/.Trash
    fi
  done
}

alias bz='batch-zip'

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
#     If a directory is given switch to it and shown its contents.
#     If a file is given show its contents.
#
# NOTES
#     The original reason why I made this was because I usually want to see
#     immediately the contents of a directory I switch to.
#
#     Executing 'cd' with no arguments changes to the home directory but I have
#     `c` simply list the current directory in that case.
#
#     `k` (https://github.com/rimraf/k) will be used if it is installed.
#
c() {
  if [ -f "$1" ]; then
    cat $@ | less
  else
    local listing=false
    if [ -n "$1" ]; then
      if [ -d "$1" ]; then
        listing=true
      fi
      cd $@
    else
      listing=true
    fi
    if [[ "$listing" == true ]]; then
      if type k >/dev/null 2>&1; then
        k --almost-all --human
      else
        ls -AGp
      fi
    fi
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
alias c-d='c ~/Downloads'
alias cs='c ~/Sites'

# ------------------------------------------------------------------------------

# Manually update things.
u() {
  upgrade_oh_my_zsh
  antigen update
  npm update -g
  gem update
  # Update Homebrew stuff by using our alias.
  bu
}

# ------------------------------------------------------------------------------

# # https://github.com/ashleynewson/SmartSim/issues/2#issuecomment-10306256
# export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig
# # pkg-config --variable pc_path pkg-config

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -f ~/.extra ]; then
  source ~/.extra
fi
