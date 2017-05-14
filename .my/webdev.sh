#!/usr/bin/env bash

source "$HOME/.my/webdev-icylace.sh"

# Drush
# A CLI tool and scripting interface for Drupal.
# http://www.drush.org/en/master/
alias dr='drush status'
alias drc='drush cache-clear all'
alias drcfu='drush cache-clear all && drush features-revert-all --yes && drush updatedb --yes'
alias drcr='drush cache-rebuild'
alias drd='drush pm-disable'
alias dre='drush pm-enable'
alias drf='drush features-revert-all --yes'
alias drff='drush features-revert-all --force --yes'
alias drfu='drush features-revert-all --yes && drush updatedb --yes'
alias drl='drush user-login'
alias drli='drush user-login --browser'
alias drlint='drush coder-review'
alias dru='drush updatedb --yes'
alias drun='drush pm-uninstall --yes'

# Vagrant
# Creates and configures portable development environments.
# https://www.vagrantup.com/
alias v='vagrant status'
alias vbl='vagrant box list'
alias vbr='vagrant box remove'
alias vd='vagrant destroy'
alias vd1='vagrant destroy --force $(vagrant global-status --prune | tail -n+3 | head -n1 | cut -c1-7)'
alias vg='vagrant global-status --prune'
alias vh='vagrant halt'
alias vp='vagrant provision'
alias vs='vagrant ssh'
alias vu='vagrant up'
alias vdu='vd1 && vu'

# Yarn
# A dependency manager for Node.js projects.
# https://yarnpkg.com/en/
alias y='yarn'


# ------------------------------------------------------------------------------
#  CakePHP
#  A PHP web framework.
#  https://cakephp.org/
# ------------------------------------------------------------------------------

#
# Simple setup for a new CakePHP project.
# 
#   $1 = Project name.
#   $2 = Custom IP address.  (optional)
#
# References:
# http://www.justinatack.com/blog/2015/install-cakephp3-laravel-homestead/
# 
setup_cakephp_homestead() {
  if [[ -z "$1" ]] ; then
    echo 'Project name required.'
    return
  fi

  if [[ ! -f "$HOME/My/Homestead/Homestead.yaml" ]] ; then
    install_homestead
  fi

  # Tweak our Homestead configuration to account for our new CakePHP project.
  local db="${1//-/_}"
  perl -0 -i -pe "s/.*\K(?=\ndatabases)/    - map: $1.dev\n      to: \/home\/vagrant\/Code\/$1\/webroot\n/s;s/.*\K(?=\n# blackfire)/    - $db\n/s" "$HOME/My/Homestead/Homestead.yaml"

  # Add our dev domain to the hosts file if it doesn't exist there already.
  # http://stackoverflow.com/a/3557165/1935675
  local ip="${2:-'192.168.10.10'}"
  local text="\n$ip    $1.dev"
  local filepath='/etc/hosts'
  sudo sh -c "sift --multiline --no-conf --quiet '$text' '$filepath' || echo '$text' >> '$filepath'"

  # Add post-provisioning steps to install a fresh CakePHP project if they weren't added already.
  text="\n[ ! -d ~/Code/$1 ] && composer create-project --prefer-dist cakephp/app ~/Code/$1"
  filepath="$HOME/My/Homestead/after.sh"
  sift --multiline --no-conf --quiet "$text" "$filepath" || echo "$text" >> "$filepath"

  homestead up --provision

  # Setup database access for our CakePHP project.
  perl -0 -i -pe "s/Datasources.*?my_app.*?\Kmy_app/$db/s;s/Datasources.*?\Kmy_app/homestead/s;s/Datasources.*?\K\/\/(.port.*?)non_standard_port_number/\${1}33060/s" "$HOME/Sites/$1/config/app.php"
}


# ------------------------------------------------------------------------------
#  Laravel
#  A PHP web framework.
#  https://laravel.com/
# ------------------------------------------------------------------------------

#
# Simple setup for a new Laravel project.  This will do most of the setup.
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
setup_laravel() {
  laravel new "$1"
  cd "$1"
  chmod -R 777 app/storage
  sed -i '' "s/your-machine-name/$(hostname)/g" bootstrap/start.php
  cp app/config/database.php app/config/local/database.php
  cp app/config/mail.php app/config/local/mail.php
  php artisan key:generate
}

install_homestead() {
  local cur_dir=$(pwd)
  cd "$HOME/My"
  git clone https://github.com/laravel/homestead.git Homestead
  cd Homestead
  bash init.sh
  sed -i '' "s/~\/Code/~\/Sites/g" Homestead.yaml
  cd "$cur_dir"
}

uninstall_homestead() {
  homestead destroy --force
  trash "$HOME/My/Homestead"
  if [[ -n "$1" ]] ; then
    homestead box remove laravel/homestead --force
  fi
}

# https://laravel.com/docs/5.4/homestead#daily-usage
homestead() {
  (cd "$HOME/My/Homestead" && vagrant $*)
}
