# http://superuser.com/questions/187639/zsh-not-hitting-profile/187673#187673
emulate sh -c "source $HOME/.profile"

source "$HOME/.my/zplug.zsh"

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

source "$HOME/.my/aliases.sh"
source "$HOME/.my/functions.zsh"
source "$HOME/.my/git.sh"
source "$HOME/.my/laravel.sh"
source "$HOME/.my/prompt.zsh"
source "$HOME/.my/xcode.sh"

# Extra stuff that's too sensitive to be committed to a public repository.
[ -f "$HOME/.not-public" ] && source "$HOME/.not-public"
