#!/usr/bin/env bash

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
