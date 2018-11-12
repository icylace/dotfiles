#!/usr/bin/env bash

alias li='ls -lAG'
alias o='open'

# https://askubuntu.com/a/332322
alias cp='cp -ip'

# Use Preview to read manual pages.
# https://discussions.apple.com/message/3541696#3541696
manp() {
  man -t $1 | open -f -a 'Preview'
}

# Convert manual pages to PDFs.
# https://discussions.apple.com/message/3542050#3542050
manpdf() {
  man -t $1 | pstopdf -i -o $1.pdf
}

# https://github.com/yrammos/dotfiles/blob/master/.bashrc
alias mv='mv -i'

# https://www.techrepublic.com/blog/10-things/cut-down-on-linux-command-line-typing-with-these-10-handy-bash-aliases/
alias df='df -h'

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md#safeguard-rm
alias rm='rm -i'

# http://kvz.io/blog/2012/10/03/quick-server-debugging-with-wtf/
alias wtf='tail -f /var/log/{dmesg,messages,*{,/*}{log,err}}'

# Find files
# https://stackoverflow.com/a/4034907
alias f='find . -name'

# https://perlgeek.de/en/article/set-up-a-clean-utf8-environment
alias screen='screen -U'

# ------------------------------------------------------------------------------

# `icdiff` is good for comparing files side-by-side.
alias icdiff='icdiff --line-numbers --tabsize=4'

# `dwdiff` is good for comparing files with long lines.
alias dwdiff='dwdiff --aggregate-changes --algorithm=best --color --line-numbers=2 --no-common'

# ------------------------------------------------------------------------------

# k
# Directory listings for zsh with git features.
# https://github.com/supercrabtree/k
alias kk='k --almost-all --human'

# ------------------------------------------------------------------------------

# ranger
# https://ranger.github.io/
alias rr='ranger --choosefiles=/tmp/ranger-files'

# ------------------------------------------------------------------------------

# Get current IP address.
alias myip='curl icanhazip.com'
