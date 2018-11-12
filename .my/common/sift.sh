#!/usr/bin/env bash

# sift
# https://sift-tool.org/
alias s='sift --binary-skip --git --exclude-ext=dmg,pdf --exclude-dirs=.stack-work'
alias sn='s --exclude-dirs=node_modules --exclude-dirs=.npm'
# TODO:
# - useful?
#   - `--exclude-files=.gitattributes,.gitignore`
