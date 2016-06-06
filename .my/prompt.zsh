#!/usr/bin/env zsh

#
# Based on:
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# http://blog.munge.net/fun-with-zsh-themes/
# http://justin.jetfive.com/2012/12/01/my-new-zsh-theme.html
#

show_prompt() {
  # local prompt_char='♿'
  # local prompt_char='❆'
  # local prompt_char='⑁'
  # local prompt_char='২'
  # local prompt_char='⁘'
  # local prompt_char='৶'
  # local prompt_char='९'
  # local prompt_char='⚕'
  # local prompt_char='⌖'
  # local prompt_char='﷽'
  # local prompt_char='ઑ'
  # local prompt_char='☙'
  # local prompt_char='♞'
  # local prompt_char='★'
  # local prompt_char='→'
  # local prompt_char='λ'
  # local prompt_char='⸚'
  # local prompt_char='➫'
  # local prompt_char='➠'
  # local prompt_char='✜'
  # local prompt_char='☾'
  # local prompt_char='త'
  # local prompt_char='✰'
  local prompt_char='♘'
  echo "%{$fg_bold[magenta]%}$prompt_char %{$reset_color%}"
}

export GIT_RADAR_COLOR_BRANCH="%{$fg_bold[cyan]%}"

# Our custom Git Radar prompt is a slight modification of the default one.
# https://github.com/michaeldfallen/git-radar/blob/master/radar-base.sh#L99
export GIT_RADAR_FORMAT="%{$fg_bold[grey]%}on git:(%{$reset_color%}%{remote: }\
%{branch}%{ :local}%{$fg_bold[grey]%})%{$reset_color%}%{ :stash}%{ :changes}"

# local return_status="%{$fg[red]%}%(?.. ∙%?∙)%{$reset_color%}"
# local return_status="%{$fg[red]%}%(?.. %?✘)%{$reset_color%}"
local return_status="%{$fg[red]%}%(?..⏎ %? )%{$reset_color%}"
# local return_status="%{$fg[red]%}%(?.. %?↵)%{$reset_color%}"
# local return_status="%{$fg[red]%}%(?.. %?∠)%{$reset_color%}"
# local return_status="%{$fg[red]%}%(?.. %?∢)%{$reset_color%}"

# Our prompt consists of the username, machine name,
# current directory, and any Git info.
export PROMPT='
%{$fg[magenta]%}%n %{$fg_bold[grey]%}at%{$reset_color%} %{$fg[yellow]%}%m \
%{$fg_bold[grey]%}in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} \
$(git-radar --zsh --fetch)
$return_status$(show_prompt) '

source "$HOME/.my/battery.zsh"

# Display the date and battery charge.
export RPROMPT='$(battery_indicator)  %{$fg_bold[grey]%}%D{%Y ∴ %m-%d ∴ %L:%M:%S %p}%{$reset_color%}'

# # TODO
# # - check if TMOUT will prematurely terminate scripts that wait for input
# #   - http://www.thegeekstuff.com/2010/05/tmout-exit-bash-shell-when-no-activity/#comment-46144
# #   - http://h30499.www3.hp.com/t5/Languages-and-Scripting/TMOUT-cause-scripts-end/m-p/5249728#M40881
# #   - http://h30499.www3.hp.com/t5/Languages-and-Scripting/TMOUT-cause-scripts-end/m-p/5249732#M40885
# TMOUT=1

# TRAPALRM() {
#   # This seems to prevent accessing command line history after the prompt resets.
#   zle reset-prompt
# }
