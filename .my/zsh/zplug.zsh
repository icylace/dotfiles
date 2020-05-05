#!/usr/bin/env zsh

# From the installation notes for zplug.
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'lib/completion', from:oh-my-zsh
zplug 'lib/functions', from:oh-my-zsh
zplug 'lib/history', from:oh-my-zsh
zplug 'lib/key-bindings', from:oh-my-zsh
zplug 'lib/misc', from:oh-my-zsh
zplug 'lib/spectrum', from:oh-my-zsh
zplug 'lib/theme-and-appearance', from:oh-my-zsh

# alias-tips
# Reminds you of aliases you have already.
# https://github.com/djui/alias-tips
zplug 'djui/alias-tips'

# k
# Directory listings for zsh with git features.
# https://github.com/supercrabtree/k
zplug 'supercrabtree/k'

# # ZSH-z
# # Jump quickly to directories that you have visited "frecently." A native ZSH port of z.sh.
# # https://github.com/agkozak/zsh-z
# zplug 'agkozak/zsh-z'

# Ensure plugins are installed.
if ! zplug check ; then
  zplug install
fi

# Source plugins and add commands to `$PATH`.
# zplug load --verbose
zplug load
