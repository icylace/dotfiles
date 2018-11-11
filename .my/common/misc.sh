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

# exa
# https://the.exa.website/
alias l0='exa --all --bytes --classify --color-scale --git --group-directories-first --header --level=1 --long --modified --sort=name'
alias l='l0 --grid'
alias l1='l0 --level=2'
alias ll='l0 --accessed --blocks --created --extended --group --inode --links --tree'
alias ll1='ll --level=2'

# https://the.exa.website/docs/colour-themes
exa_colors() {
  local di='di=38;5;133'
  local fi='fi=38;5;177'
  local fileClasses="$di:$fi"

  local da='da=38;5;68'
  local hd='hd=38;5;27'
  local detailsAndMetadata="$da:$hd"

  local uu='uu=38;5;240'
  local gu='gu=38;5;240'
  local ownersAndGroups="$uu:$gu"

  local ur='ur=38;5;100'
  local uw='uw=38;5;101'
  local ux='ux=38;5;102'
  local ue='ue=38;5;103'
  local gr='gr=38;5;104'
  local gw='gw=38;5;105'
  local gx='gx=38;5;106'
  local tr='tr=38;5;107'
  local tw='tw=38;5;108'
  local tx='tx=38;5;109'
  local su='su=38;5;110'
  local sf='sf=38;5;111'
  local xa='xa=38;5;112'
  local permissions="$ur:$uw:$ux:$ue:$gr:$gw:$gx:$tr:$tw:$tx:$su:$sf:$xa"

  export EXA_COLORS="$fileClasses:$detailsAndMetadata:$ownersAndGroups:$permissions"
}

exa_colors

# TODO: include installation steps in mac setup script...
# https://github.com/trapd00r/LS_COLORS
eval $(gdircolors --bourne-shell "$HOME/LS_COLORS")

# ------------------------------------------------------------------------------

# ranger
# https://ranger.github.io/
alias rr='ranger --choosefiles=/tmp/ranger-files'

# ------------------------------------------------------------------------------

# Get current IP address.
alias myip='curl icanhazip.com'
