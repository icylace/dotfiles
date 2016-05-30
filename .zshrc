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
#  zsh-hints
#  Display non-completable trivia right under your editing buffer.
#  https://github.com/joepvd/zsh-hints
# ------------------------------------------------------------------------------

export XDG_DATA_HOME="$HOME/.my/zsh-hints"

# https://github.com/joepvd/zsh-hints#the-basic-setup
fpath=("$HOME"/.my/autoload $fpath)
autoload "$HOME"/.my/autoload/*(:t)

zle -N zsh-hints-param zsh-hints
bindkey "^Xp" zsh-hints-param
zle -N zsh-hints-paramflags zsh-hints
bindkey "^Xf" zsh-hints-paramflags
zle -N zsh-hints-glob zsh-hints
bindkey "^Xg" zsh-hints-glob


# ------------------------------------------------------------------------------
#  Colorize the output for some commands.
# ------------------------------------------------------------------------------

source "$(brew --prefix)/etc/grc.bashrc"

alias hexdump='colourify hexdump'

# ------------------------------------------------------------------------------

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -f "$HOME/.not-public/extra.sh" ] ; then
  source "$HOME/.not-public/extra.sh"
fi
