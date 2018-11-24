#!/usr/bin/env bash

# Sets up a new web project.
#
# Parameters:
# $1 = Code for project type.
# $2 = Name for project directory.
#
gimme() {
  local error='\e[1;31m'
  local reset='\e[0m'

  case "$1" in
    purs) ;;
    ts) ;;
    *)
      echo "${error}You need to use a proper project code!${reset}"
      return 1
      ;;
  esac

  if [[ -z "$2" ]] ; then
    echo "${error}You need to name your new project!${reset}"
    return 1
  fi

  local scaffoldFile="$HOME/My/Code/webdev-scaffolding/scaffold/$1.sh"
  if [[ -f "$scaffoldFile" ]] ; then
    "$scaffoldFile" "$2"
  fi

  if [[ "$?" -ne 0 ]] ; then
    echo "${error}Errors happened!${reset}"
    return 1
  fi

  echo "\n\n🔥  🎉  ✨  --------[ Project setup done ! ]-------- ✨  🎉  🔥"

  cd "./$2"
}

# ------------------------------------------------------------------------------

# # Vagrant
# # Creates and configures portable development environments.
# # https://www.vagrantup.com/
# alias v='vagrant status'
# alias vbl='vagrant box list'
# alias vbr='vagrant box remove'
# alias vd='vagrant destroy'
# alias vd1='vagrant destroy --force $(vagrant global-status --prune | tail -n+3 | head -n1 | cut -c1-7)'
# alias vg='vagrant global-status --prune'
# alias vh='vagrant halt'
# alias vp='vagrant provision'
# alias vs='vagrant ssh'
# alias vu='vagrant up'
# alias vdu='vd1 && vu'

# Yarn
# A dependency manager for Node.js projects.
# https://yarnpkg.com/en/
alias y='yarn'

# alias dev='autoreload-server ./ 3000'
