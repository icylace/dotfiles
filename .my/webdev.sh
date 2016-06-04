#!/usr/bin/env bash

# Bower
alias bo='bower list'
alias boi='bower install'
alias bos='bower search'

# Drush
alias dr='drush'
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


# ------------------------------------------------------------------------------
#  Laravel
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
  laravel new "$1"
  cd "$1"
  chmod -R 777 app/storage
  sed -i '' "s/your-machine-name/$(hostname)/g" bootstrap/start.php
  cp app/config/database.php app/config/local/database.php
  cp app/config/mail.php app/config/local/mail.php
  php artisan key:generate
}
