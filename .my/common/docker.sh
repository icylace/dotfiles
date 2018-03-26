#!/usr/bin/env bash

# Docker
# Pack, ship and run any application as a lightweight container
# https://www.docker.com/

alias d='docker'
alias dcl='docker container list --all'
alias dce='docker container run'
alias dci='docker container inspect'
alias dcr='docker container run'
alias dcs='docker container stop'
alias dcrm='docker container rm --force'
alias dcrm+='docker container rm --force $(docker container list --quiet)'
alias dcrm++='docker container rm --force $(docker container list --all --quiet)'

alias dib='docker image build'
alias dih='docker image history'
alias dii='docker image inspect'
alias dil='docker image list --all'
alias dip='docker image pull'
alias dipr='docker image prune'
alias dirm='docker image rm --force'
alias dirm+='docker image rm --force $(docker image list --quiet)'
alias dirm++='docker image rm --force $(docker image list --all --quiet)'

# Docker Compose
# Isolated development environments using Docker
# https://docs.docker.com/compose/
alias dco='docker-compose'
alias dcou='docker-compose up'
alias dcod='docker-compose down'
