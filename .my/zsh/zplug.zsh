#!/usr/bin/env zsh

if [ -f /usr/local/opt/zplug/init.zsh ] ; then
  source /usr/local/opt/zplug/init.zsh
elif [ -f /usr/share/zplug/init.zsh ] ; then
  source /usr/share/zplug/init.zsh
else
  echo '`zplug` is not installed.'
  return
fi

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

# z
# Navigate your most used directories based on 'frecency'.
# https://github.com/rupa/z
zplug 'rupa/z', use:'*.sh'

# zsh-syntax-highlighting
# Syntax highlighing for the command line.
# https://github.com/zsh-users/zsh-syntax-highlighting
zplug 'zsh-users/zsh-syntax-highlighting', defer:3

# Ensure plugins are installed.
if ! zplug check ; then
  zplug install
fi

# Source plugins and add commands to `$PATH`.
# zplug load --verbose
zplug load
