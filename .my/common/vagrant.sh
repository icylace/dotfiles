#!/usr/bin/env bash

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
