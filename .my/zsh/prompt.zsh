#!/usr/bin/env zsh

source "$HOME/.my/zsh/battery.zsh"

setopt PROMPT_SUBST

# Based on:
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# https://blog.munge.net/post/fun-with-zsh-themes/
# https://justin.jetfive.com/2012/12/01/my-new-zsh-theme.html

select_prompt_char() {
  setopt local_options KSH_ARRAYS

  local prompt_chars=(
    'λ' '९' '২' '৶' 'ઑ' 'త' 'ຯ' '᠁' '…' '⁘' '→' '⋮' '⋯' '⋰' '⋱' '⌖' '␥' '⑀'
    '⑁' '⑂' '⑃' '⑄' '⑅' '⑆' '⑇' '⑈' '⑉' '⑊' '★' '☙' '☾' '♘' '♞'

    # From the Dingbats Unicode block:
    '✙' '✚' '✛' '✜' '✢' '✣' '✤' '✥' '✦' '✧' '✩' '✪' '✫' '✬' '✭' '✮' '✯' '✰' '✱'
    '✲' '✳' '✴' '✵' '✶' '✷' '✸' '✹' '✺' '✻' '✼' '✽' '✾' '✿' '❀' '❁' '❂' '❃' '❄'
    '❅' '❆' '❇' '❈' '❉' '❊' '❋' '❖' '❝' '❦' '❧' '❭' '❯' '❱' '➔' '➘' '➙' '➚' '➛'
    '➜' '➝' '➞' '➟' '➠' '➡' '➢' '➣' '➤' '➥' '➦' '➧' '➨' '➩' '➪' '➫' '➬' '➭' '➮'
    '➯' '➱' '➳' '➴' '➵' '➶' '➷' '➸' '➹' '➺' '➻' '➼' '➽' '➾'

    '⸚' '︙' '𝛌' '𝝺' '𝞝'
  )

  # Select a random prompt character.
  echo "${prompt_chars[$((RANDOM % ${#prompt_chars[@]}))]}"
}

select_exit_status_char() {
  setopt local_options KSH_ARRAYS

  local exit_status_chars=('↵' '∠' '∢' '⏎' '✘')

  # Select a random return status character.
  echo "${exit_status_chars[$((RANDOM % ${#exit_status_chars[@]}))]}"
}

# https://unix.stackexchange.com/a/126316
# https://unix.stackexchange.com/questions/53789/whats-the-newline-symbol-in-zshs-ps1#comment428362_126316
export N=$'\n'

precmd() {
  # Force our prompt characters to update...
  export PROMPT_CHAR="$RANDOM"
  export EXIT_STATUS_CHAR="$RANDOM"

  # ...so they can be different characters after every command.
  export PROMPT_CHAR="$(select_prompt_char)"
  export EXIT_STATUS_CHAR="$(select_exit_status_char)"

  # The first part of our prompt consists of the username, machine name,
  # current directory, any available Git info, and battery charge.
  # https://stackoverflow.com/a/33839913
  if type gitHUD > /dev/null 2>&1 ; then
    local repository_status="$(gitHUD zsh)"
  fi
  local preprompt_left="$N%F{magenta}%n %B%F{black}at%b %F{yellow}%m %B%F{black}in %b%F{green}${PWD/#$HOME/~}%f $repository_status"
  local preprompt_right="$(battery_indicator)"
  local preprompt_left_length=${#${(S%%)preprompt_left//(\%([KF1]|)\{*\}|\%[Bbkf])}}
  local preprompt_right_length=${#${(S%%)preprompt_right//(\%([KF1]|)\{*\}|\%[Bbkf])}}
  local num_filler_spaces=$((COLUMNS - preprompt_left_length - preprompt_right_length))
  print -Pr "$preprompt_left${(l:$num_filler_spaces:)}$preprompt_right"
}

preexec() {
  # Show when a command is executed.  Normally, this will be almost completely
  # hidden visually because I generally don't need it but in the event where I
  # do it can be revealed through text selection.
  #
  # TODO:
  # - use the same time format as `RPROMPT`.
  echo "$fg[black]$(date +%r)$reset_color"
}

# export GIT_RADAR_COLOR_BRANCH="%B%F{cyan}"

# # Our custom Git Radar prompt is a slight modification of the default one.
# # https://github.com/michaeldfallen/git-radar/blob/master/radar-base.sh#L99
# export GIT_RADAR_FORMAT="%B%F{black}on git:(%b%f%{remote: }%{branch}%{ :local}%B%F{black})%b%f%{ :stash}%{ :changes}"

# The second part of our prompt contains the exit status code,
# user input marker, and the date and time.
export PROMPT='%(?..%F{red}$EXIT_STATUS_CHAR %B%?$N%b%f)%B%F{magenta}$PROMPT_CHAR%b%f  '
export RPROMPT='%B%F{black}%D{%L:%M:%S %p ∴ %a ∴ %b %e}%b%f'

# # TODO:
# # - check if TMOUT will prematurely terminate scripts that wait for input
# #   - https://www.thegeekstuff.com/2010/05/tmout-exit-bash-shell-when-no-activity/#comment-46144
# #   - https://community.hpe.com/t5/Languages-and-Scripting/TMOUT-cause-scripts-end/m-p/5249728#M40881
# #   - https://community.hpe.com/t5/Languages-and-Scripting/TMOUT-cause-scripts-end/m-p/5249732#M40885
# TMOUT=1

# # https://askubuntu.com/a/360172
# # https://github.com/robbyrussell/oh-my-zsh/issues/5910
# # https://github.com/robbyrussell/oh-my-zsh/issues/5910#issuecomment-294509017
# TRAPALRM() {
#   if [[ $WIDGET != *"complete"* && $WIDGET != *"beginning-search" ]] ; then
#     zle reset-prompt
#   fi
# }
