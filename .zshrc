# http://superuser.com/questions/187639/zsh-not-hitting-profile/187673#187673
[ -r "$HOME/.profile" ] && emulate sh -c "source $HOME/.profile"

[ -r "$HOME/.my/aliases.sh" ] && source "$HOME/.my/aliases.sh"

# Tell Z Shell to not try to autocorrect the following.
# http://superuser.com/questions/251818/exceptions-to-zsh-correctall-feature/271897#271897
alias bower='nocorrect bower'
alias composer='nocorrect composer'
alias drush='nocorrect drush'
alias npm='nocorrect npm'

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# ------------------------------------------------------------------------------

setup_with_zplug() {
  export ZPLUG_HOME=/usr/local/opt/zplug

  if [ ! -r "$ZPLUG_HOME/init.zsh" ] ; then
    echo 'zplug is not installed.'
    return
  fi

  source "$ZPLUG_HOME/init.zsh"

  zplug "lib/completion", from:oh-my-zsh
  zplug "lib/functions", from:oh-my-zsh
  zplug "lib/history", from:oh-my-zsh
  zplug "lib/key-bindings", from:oh-my-zsh
  zplug "lib/misc", from:oh-my-zsh
  zplug "lib/spectrum", from:oh-my-zsh
  zplug "lib/theme-and-appearance", from:oh-my-zsh

  # alias-tips
  # Reminds you of aliases you have already.
  # https://github.com/djui/alias-tips
  zplug "djui/alias-tips"

  # k
  # Directory listings for zsh with git features.
  # https://github.com/rimraf/k
  zplug "rimraf/k"

  # z
  # Navigate your most used directories based on 'frecency'.
  # https://github.com/rupa/z
  zplug "rupa/z", use:"*.sh"

  # zsh-syntax-highlighting
  # Syntax highlighing for the command line.
  # https://github.com/zsh-users/zsh-syntax-highlighting
  zplug "zsh-users/zsh-syntax-highlighting", nice:19

  # Ensure plugins are installed.
  if ! zplug check --verbose ; then
    zplug install
  fi

  # Source plugins and add commands to `$PATH`.
  zplug load --verbose
}

setup_with_zplug

# ------------------------------------------------------------------------------

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
  # local prompt_char='﷽'
  # local prompt_char='ઑ'
  # local prompt_char='☙'
  # local prompt_char='♞'
  local prompt_char='♘'
  echo "%{$fg_bold[magenta]%}$prompt_char %{$reset_color%}"
}

export GIT_RADAR_COLOR_BRANCH="%{$fg_bold[cyan]%}"

# Our custom Git Radar prompt is a slight modification of the default one.
# https://github.com/michaeldfallen/git-radar/blob/master/radar-base.sh#L99
export GIT_RADAR_FORMAT="on %{$fg_bold[grey]%}git:(%{$reset_color%}%{remote: }\
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
%{$fg[magenta]%}%n%{$reset_color%} \
at %{$fg[yellow]%}%m%{$reset_color%} \
in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} \
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

# ------------------------------------------------------------------------------

#
# Batch Zip
#
# Based on:
# http://hints.macworld.com/article.php?story=20070803053156346
# http://www.macworld.com/article/1134810/zipmany.html
# http://alexsantidote.com/334/batch-zip-and-rename/
# http://askubuntu.com/questions/360063/how-to-show-a-running-clock-in-terminal-before-the-command-prompt/360172#360172
#
bz() {
  for f in "$@" ; do
    # Check that the file exists and that it's not in fact a directory.
    if [[ -e "$f" && ! (-d "$f") ]] ; then
      zip --junk-paths -9 "${f%.*}.zip" "$f"
      mv "$f" "$HOME/.Trash"
    fi
  done
}


# ------------------------------------------------------------------------------

#
# NAME
#     c - See the contents of a directory or file.
#
# SYNOPSIS
#     c [file]
#
# DESCRIPTION
#     If no operand is given the contents of the current directory is shown.
#     If a directory is given switch to it and show its contents.
#     If a file is given show its contents.  Otherwise try to switch to a
#     "frecent" directory of a similar name to the given operand.
#
# NOTES
#     The original reason why I made this was because I usually want to see
#     immediately the contents of a directory I switch to.
#
#     Executing 'cd' with no arguments changes to the home directory but I have
#     `c` simply list the current directory in that case.
#
#     The following are used if they are installed:
#     - `catimg`: https://github.com/posva/catimg
#     - `highlight`: http://andre-simon.de/doku/highlight/en/highlight.php
#     - `k`: https://github.com/rimraf/k
#     - `z`: https://github.com/rupa/z
#
# TODO
# - use `cat` when `highlight` doesn't work
# - use `cd` for arguments like "-1" and "+1"
# - consider using `vim -R` for viewing text files
#
c() {
  # If we're given a readble file then view it.
  if [ -r "$1" ] ; then
    local it_is_an_image=$(file --brief $1 | grep --count --regexp=image)
    if [ "$it_is_an_image" -ne 0 ] ; then
      if type catimg >/dev/null 2>&1 ; then
        catimg -l 0 "$@"
      fi
    elif type highlight >/dev/null 2>&1 ; then
      local color_text=$(highlight --style=andes --out-format=xterm256 "$@")
      echo $color_text | less
    else
      cat "$@" | less
    fi
    return
  fi

  # If we're given something and it's not a file then it must be a
  # directory so try to switch to it.
  if [ -n "$1" ] ; then

    # TODO
    # - complete this
    #
    # # If the input begins with `-` or `+` followed by a number use `cd`.
    # local first_character=${word::1}
    # if [ $first_character = '-' ] ; then
    #   if [ following token is an integer ] ; then
    #     cd $@
    #   fi
    # fi

    if [ -d "$1" ] ; then
      cd "$@"
    elif type z >/dev/null 2>&1 ; then
      z "$@"
      if [ $? -ne 0 ] ; then
        echo "\"$1\" could not be found."
        return
      fi
      pwd
    fi
  fi

  # Show the contents of the current directory.
  if type k >/dev/null 2>&1 ; then
    k --almost-all --human
  else
    ls -AGp
  fi
}

alias c.='c ..'
alias c..='c ..'
alias c.2='c ...'
alias c.3='c ....'
alias c.4='c .....'
alias c.5='c ......'
alias c/='c /'
alias c~='c ~'
alias c-='c -1'
alias c+='c +1'
alias c.d='c ~/Downloads'
alias cs='c ~/Sites'

# ------------------------------------------------------------------------------

# Manually update things.
u() {
  upgrade_oh_my_zsh
  zplug update
  npm update -g
  gem update --system
  gem update
  pip install --upgrade pip setuptools
  brew update && brew upgrade --all && brew cleanup && brew cask cleanup
}

# ------------------------------------------------------------------------------

# Xcode-related stuff.
[ -r "$HOME/.my/xcode.sh" ] && source "$HOME/.my/xcode.sh"

# Extra stuff that's too sensitive to be committed to a public repository.
[ -r "$HOME/.not-public" ] && source "$HOME/.not-public"
