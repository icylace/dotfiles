# http://superuser.com/questions/187639/zsh-not-hitting-profile/187673#187673
emulate sh -c "source $HOME/.profile"

source "$HOME/.my/zplug.zsh"

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

source "$HOME/.my/aliases.sh"
source "$HOME/.my/functions.sh"
source "$HOME/.my/c.zsh"
source "$HOME/.my/git.sh"
source "$HOME/.my/laravel.sh"
source "$HOME/.my/prompt.zsh"
source "$HOME/.my/xcode.sh"

# ------------------------------------------------------------------------------

# TODO
# - get zsh-hints working

# # https://github.com/joepvd/zsh-hints#the-basic-setup
# fpath=(~/.zfun $fpath)
# autoload ~/.zfun/*(:t)

zle -N zsh-hints-param zsh-hints
bindkey "^Xp" zsh-hints-param
zle -N zsh-hints-paramflags zsh-hints
bindkey "^Xf" zsh-hints-paramflags
zle -N zsh-hints-glob zsh-hints
bindkey "^Xg" zsh-hints-glob

# ------------------------------------------------------------------------------

source "$(brew --prefix)/etc/grc.bashrc"

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -f "$HOME/.not-public" ] ; then
  source "$HOME/.not-public"
fi
