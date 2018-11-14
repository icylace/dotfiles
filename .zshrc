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

source "$HOME/.nix-profile/etc/grc.zsh"

alias hexdump='grc --colour=auto hexdump'

# ------------------------------------------------------------------------------

# Set defaults for the `less` command.
export LESS='--chop-long-lines --LONG-PROMPT --RAW-CONTROL-CHARS --shift .2 --status-column'

export LESS_TERMCAP_mb=$'\e[1;35m'        # begin blinking
export LESS_TERMCAP_md=$'\e[1;35m'        # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[1;30m'        # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[1;36m'        # begin underline

# ------------------------------------------------------------------------------

# Set Kakoune as the default editor.
export EDITOR=kak
export VISUAL=kak

# ------------------------------------------------------------------------------

# https://dougblack.io/words/zsh-vi-mode.html

# # Use vi mode.
# bindkey -v

# Use Emacs mode.
bindkey -e

# function zle-line-init zle-keymap-select {
#   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
#   # RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
#   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#   zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select

# Make the terminal respond faster to the escape key.
export KEYTIMEOUT=1

# ------------------------------------------------------------------------------

# https://www.iterm2.com/documentation-shell-integration.html
if [ -f "$HOME/.iterm2_shell_integration.zsh" ] ; then
  source "$HOME/.iterm2_shell_integration.zsh"
fi

# Extra stuff that doesn't makes sense to include in a public repository.
if [ -f "$HOME/.not-public/extra.sh" ] ; then
  source "$HOME/.not-public/extra.sh"
fi
