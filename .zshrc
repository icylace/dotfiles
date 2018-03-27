source "$HOME/.zprofile"

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md#safeguard-rm
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

source "$HOME/.my/zsh/zplug.zsh"
source "$HOME/.my/common.sh"
source "$HOME/.my/zsh/c.zsh"
source "$HOME/.my/zsh/hints.zsh"
source "$HOME/.my/zsh/i.zsh"
source "$HOME/.my/zsh/prompt.zsh"

# ------------------------------------------------------------------------------
#  Colorize the output for some commands.
# ------------------------------------------------------------------------------

if type brew > /dev/null 2>&1 ; then
  source "$(brew --prefix)/etc/grc.bashrc"
fi

alias hexdump='colourify hexdump'

# ------------------------------------------------------------------------------

# Set defaults for the `less` command.
export LESS='--chop-long-lines --LONG-PROMPT --RAW-CONTROL-CHARS --shift .2 --status-column'

# Colorize manual pages.
# http://www.matrix44.net/blog/?p=870
export LESS_TERMCAP_mb=$'\e[1;35m'        # begin blinking
export LESS_TERMCAP_md=$'\e[1;35m'        # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[1;30m'        # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[1;36m'        # begin underline

# ------------------------------------------------------------------------------

# https://www.iterm2.com/documentation-shell-integration.html
if [ -f "$HOME/.iterm2_shell_integration.zsh" ] ; then
  source "$HOME/.iterm2_shell_integration.zsh"
fi

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -f "$HOME/.not-public/extra.sh" ] ; then
  source "$HOME/.not-public/extra.sh"
fi
