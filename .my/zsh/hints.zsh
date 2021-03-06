#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
#  zsh-hints
#  Display non-completable trivia right under your editing buffer.
#  https://github.com/joepvd/zsh-hints
# ------------------------------------------------------------------------------

export XDG_DATA_HOME="$HOME/.my/zsh-hints"

# https://github.com/joepvd/zsh-hints#the-basic-setup
fpath=("$HOME"/.my/autoload $fpath)
autoload "$HOME"/.my/autoload/*(:t)

# From installation notes for zsh-completions.
fpath=(/usr/local/share/zsh-completions $fpath)

# From installation notes for zsh-syntax-highlighting.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zle -N zsh-hints-param zsh-hints
bindkey "^Xp" zsh-hints-param

zle -N zsh-hints-paramflags zsh-hints
bindkey "^Xf" zsh-hints-paramflags

zle -N zsh-hints-glob zsh-hints
bindkey "^Xg" zsh-hints-glob
