# Uncomment these to use the GNU Core Utilities with their normal names.
# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:$HOME/.rvm/bin"
# MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# ------------------------------------------------------------------------------

# Use the same aliases as bash.
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

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
  # hg root >/dev/null 2>/dev/null && echo '☿' && return
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
  #   --format-hg  "on %{$fg[magenta]%}%b%{$reset_color%}%{$fg[green]%}%u%m%{$reset_color%}" \
  #   --format     "on %s %{$fg[magenta]%}%b%{$reset_color%}%{$fg[green]%}%u%m%{$reset_color%}"
}

virtualenv_info() {
  [ $VIRTUAL_ENV ] && echo '('$(basename $VIRTUAL_ENV)') '
}

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"

# $(hg_prompt_info)$(git_prompt_info)

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

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

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
alias c..2='c ...'
alias c..3='c ....'
alias c..4='c .....'
alias c..5='c ......'
alias c/='c /'
alias c~='c ~'
alias c-='c -1'
alias c+='c +1'

# Personalized uses:
alias c-d='c ~/Downloads'
alias c-o='c ~/My/Output'
alias cr='c ~/My/Repositories'
alias cs='c ~/Sites'
alias cn='c /usr/local/lib/node_modules'
alias ct='c ~/My/tmp'
alias cv='c ~/My/Repositories/vagrant-base'

# ------------------------------------------------------------------------------

# Manually update things.
u() {
  upgrade_oh_my_zsh
  antigen update
  npm update -g
  # Update Homebrew stuff by using our alias.
  bu
}

# ------------------------------------------------------------------------------

#
# Tell Z Shell to not try to autocorrect the following.
#
# Based on:
# http://superuser.com/questions/251818/exceptions-to-zsh-correctall-feature/271897#271897
#

alias co='nocorrect composer'
alias composer='nocorrect composer'
alias npm='nocorrect npm'

# Bower
alias bower='nocorrect bower'
alias bo='bower'
alias boi="bower install"
alias bol="bower list"
alias bos="bower search"

# Drush
alias drush='nocorrect drush'
alias dr='drush'
alias drc='drush cc all'
alias drcfu='drush cc all && drush fra -y && drush updb -y'
alias drcr='drush cr'
alias drd='drush dis'
alias dre='drush en'
alias drf='drush fra -y'
alias drfu='drush fra -y && drush updb -y'
alias drl='drush uli'
alias dru='drush updb -y'

# ------------------------------------------------------------------------------
#  Use Preview to read man pages.
#  http://brettterpstra.com/2014/08/05/shell-tricks-man-pages/
# ------------------------------------------------------------------------------
alias manp="man -t ${1} | open -f -a Preview"

# ------------------------------------------------------------------------------

# Suggested by the caveats section from `brew info rbenv`.
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ------------------------------------------------------------------------------

export DOCKER_HOST=tcp://192.168.59.103:2375

# http://stackoverflow.com/questions/5545715/how-do-i-add-usr-local-git-bin-to-the-path-on-mac-osx/5545748#5545748
# http://stackoverflow.com/questions/8814618/installing-mysqldb-on-mac/8814780#8814780

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Applications/MAMP/bin/php/php5.5.3/bin:$PATH"
export PATH="/Applications/MAMP/Library/bin:$PATH"
export PATH="${HOME}/Library/Haskell/bin:$PATH"
export PATH="${HOME}/.cabal/bin:$PATH"
export PATH="${HOME}/.composer/vendor/bin:$PATH"
export PATH="${HOME}/.node/bin:$PATH"

nvm_file="$(brew --prefix nvm)/nvm.sh"
if [ -f $nvm_file ]; then
  # Recommended by Homebrew.
  export NVM_DIR=~/.nvm
  source $nvm_file
fi

# # https://github.com/ashleynewson/SmartSim/issues/2#issuecomment-10306256
# export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig
# # pkg-config --variable pc_path pkg-config

# My custom PHP development tools.
export DEV_INC="${HOME}/My/Repositories/dev/includes/dev.inc"

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -d ~/.extra ]; then
  source ~/.extra
fi
