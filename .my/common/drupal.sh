#!/usr/bin/env bash

# Drush
# A CLI tool and scripting interface for Drupal.
# https://www.drush.org/
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
