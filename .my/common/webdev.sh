#!/usr/bin/env bash

# Sets up a new web project.
#
# Parameters:
# $1 - Code for project type.
#
gimme() {
  local errorRed='\033[1;31m'
  local reset='\033[0m'

  case "$1" in
    hps) ;;
    hts) ;;
    *)
      echo "${errorRed}You need to use a proper project code!${reset}"
      return 1
      ;;
  esac

  if [[ -z "$2" ]] ; then
    echo "${errorRed}You need to name your new project!${reset}"
    return 1
  fi

  local scaffoldFile="$HOME/My/Code/webdev-scaffolding/scaffold/${1}.sh"
  if [[ -f "$scaffoldFile" ]] ; then
    "$scaffoldFile" "$2"
  fi

  if [[ "$?" -ne 0 ]] ; then
    echo "${errorRed}Errors happened!${reset}"
    return 1
  fi

  echo "\n\n🔥  🎉  ✨  --------[ Project setup done ! ]-------- ✨  🎉  🔥"

  cd "./$2"
}

# ------------------------------------------------------------------------------

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

# alias dev='autoreload-server ./ 3000'

# ------------------------------------------------------------------------------
#  CakePHP
#  A PHP web framework.
#  https://cakephp.org/
# ------------------------------------------------------------------------------

# Simple setup for a new CakePHP project.
#
#    $1 = Project name.
#    $2 = Custom IP address.  (optional)
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
  # https://stackoverflow.com/a/3557165
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
