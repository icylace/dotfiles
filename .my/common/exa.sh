#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  exa
#  A modern replacement for ls.
#  https://the.exa.website/
# ------------------------------------------------------------------------------

alias l0='exa --all --bytes --classify --color-scale --git --group-directories-first --header --level=1 --long --modified --sort=name'
alias l='l0 --grid'
alias l1='l0 --level=2'
alias ll='l0 --accessed --blocks --created --extended --group --inode --links --tree'
alias ll1='ll --level=2'

# https://the.exa.website/docs/colour-themes
setup_exa_colors() {
  local di='di=38;5;133'
  local fi='fi=38;5;177'
  local fileClasses="$di:$fi"

  local da='da=38;5;68'
  local hd='hd=38;5;27;4'
  local detailsAndMetadata="$da:$hd"

  local uu='uu=38;5;240'
  local gu='gu=38;5;240'
  local ownersAndGroups="$uu:$gu"

  local ur='ur=38;5;95'
  local uw='uw=38;5;95'
  local ux='ux=38;5;95'
  local ue='ue=38;5;95'
  local gr='gr=38;5;95'
  local gw='gw=38;5;95'
  local gx='gx=38;5;95'
  local tr='tr=38;5;95'
  local tw='tw=38;5;95'
  local tx='tx=38;5;95'
  local su='su=38;5;95'
  local sf='sf=38;5;95'
  local xa='xa=38;5;23'
  local permissions="$ur:$uw:$ux:$ue:$gr:$gw:$gx:$tr:$tw:$tx:$su:$sf:$xa"

  export EXA_COLORS="$fileClasses:$detailsAndMetadata:$ownersAndGroups:$permissions"
}

setup_exa_colors

# TODO: include installation steps in mac setup script...
# https://github.com/trapd00r/LS_COLORS
eval $(gdircolors --bourne-shell "$HOME/.my/LS_COLORS")
