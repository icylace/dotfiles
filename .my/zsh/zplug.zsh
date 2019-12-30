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

# zsh-syntax-highlighting
# Fish shell like syntax highlighting for Zsh.
# https://github.com/zsh-users/zsh-syntax-highlighting
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# Ensure plugins are installed.
if ! zplug check ; then
  zplug install
fi

# Source plugins and add commands to `$PATH`.
# zplug load --verbose
zplug load
