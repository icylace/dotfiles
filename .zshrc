# http://superuser.com/questions/187639/zsh-not-hitting-profile/187673#187673
if [ -f ~/.profile ]; then
  emulate sh -c 'source ~/.profile'
fi

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

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

# https://github.com/tarjoilija/zgen#automatically-check-for-filechanges-and-regenerate-zinit
export ZGEN_RESET_ON_CHANGE="$HOME/.zshrc"

# export ZSH_THEME="bira"

# zgen
# A lightweight plugin manager for ZSH inspired by Antigen.
# https://github.com/tarjoilija/zgen
# https://github.com/unixorn/zsh-quickstart-kit/blob/master/zsh/.zgen-setup
if [ ! -f "$HOME/zgen/zgen.zsh" ]; then
  git clone git@github.com:tarjoilija/zgen.git "$HOME/zgen"
fi

source "$HOME/zgen/zgen.zsh"

if ! zgen saved; then
  echo 'Creating a zgen init script.'

  zgen oh-my-zsh

  # alias-tips
  # Reminds you of aliases you have already.
  # https://github.com/djui/alias-tips
  zgen load djui/alias-tips

  # k
  # Directory listings for zsh with git features.
  # https://github.com/rimraf/k
  zgen load rimraf/k

  # z
  # Navigate your most used directories based on 'frecency'.
  # https://github.com/rupa/z
  zgen load rupa/z

  # TODO
  # - create a custom theme
  # zgen oh-my-zsh themes/bira
  # zgen oh-my-zsh themes/amuse

  zgen save
fi

# ------------------------------------------------------------------------------

#
# Based on:
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# http://blog.munge.net/fun-with-zsh-themes/
# http://justin.jetfive.com/2012/12/01/my-new-zsh-theme.html
#

show_prompt() {
  # git branch >/dev/null 2>/dev/null && echo '±' && return
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
export GIT_RADAR_FORMAT="on %{$fg_bold[grey]%}git:(%{$reset_color%}%{remote: }%{branch}%{ :local}%{$fg_bold[grey]%})%{$reset_color%}%{ :stash}%{ :changes}"

battery_charge() {
  local battery_charge_code="$HOME/My/Shell/battery_charge.py"
  # TODO
  # local battery_charge_code="$HOME/My/Shell/battery_charge.sh"
  if [ -f $battery_charge_code ]; then
    python $battery_charge_code --color
    # TODO
    # source $battery_charge_code
  fi
}

# local return_char='✘'
# local return_char='⏎'
# local return_char='↵'
local return_status="%{$fg[red]%}%(?.. ∙%?∙)%{$reset_color%}"

# Our prompt consists of the username, machine name,
# current directory, and any Git info.
export PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} \
at %{$fg[yellow]%}%m%{$reset_color%} \
in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} \
$(git-radar --zsh --fetch)
$(show_prompt)${return_status} '

# Display the date and battery charge.
export RPROMPT='$(battery_charge)  %{$fg_bold[grey]%}%D{%Y ∴ %m-%d ∴ %L:%M:%S %p}%{$reset_color%}'

# TODO
# - check if TMOUT will prematurely terminate scripts that wait for input
#   - http://www.thegeekstuff.com/2010/05/tmout-exit-bash-shell-when-no-activity/#comment-46144
#   - http://h30499.www3.hp.com/t5/Languages-and-Scripting/TMOUT-cause-scripts-end/m-p/5249728#M40881
#   - http://h30499.www3.hp.com/t5/Languages-and-Scripting/TMOUT-cause-scripts-end/m-p/5249732#M40885
TMOUT=1

TRAPALRM() {
  zle reset-prompt
}

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
  for f in "$@"; do
    # Check that the file exists and that it's not in fact a directory.
    if [[ -e "$f" && ! (-d "$f") ]]; then
      zip --junk-paths -9 "${f%.*}.zip" "$f"
      mv "$f" ~/.Trash
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
#     `k` (https://github.com/rimraf/k) will be used if it is installed.
#     `z` (https://github.com/rupa/z) will be used if it is installed.
#
# TODO
# - use `cd` for arguments like "-1" and "+1"
#
c() {
  # If we're given a file view it.
  if [ -f "$1" ]; then
    local it_is_an_image=$(file --brief $1 | grep --count --regexp=image)
    if [ "$it_is_an_image" -ne 0 ]; then
      if type catimg >/dev/null 2>&1; then
        catimg $@
      fi
    elif type highlight >/dev/null 2>&1; then
      highlight --style=andes --out-format=xterm256 $@ | less
    else
      cat $@ | less
    fi
    return
  fi

  # If we're given something and it's not a file then it must be a
  # directory so try to switch to it.
  if [ -n "$1" ]; then
    if [ -d "$1" ]; then
      cd $@
    elif type z >/dev/null 2>&1; then
      z $@
      if [ $? -ne 0 ]; then
        echo "\"$1\" could not be found."
        return
      fi
      pwd
    fi
  fi

  # Show the contents of the current directory.
  if type k >/dev/null 2>&1; then
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
  zgen selfupdate
  zgen update
  npm update -g
  gem update --system
  gem update
  pip install --upgrade pip setuptools
  brew update && brew upgrade --all && brew cleanup && brew cask cleanup
}

# ------------------------------------------------------------------------------

x() {
  xb

  if [ $? -ne 0 ]; then
    return
  fi

  # If no scheme name is provided by the caller then
  # get the scheme name from the current directory.
  local scheme="$1"
  if [ -z $scheme ]; then
    scheme=$(basename "$(pwd)")
  fi

  local config='Debug'        # May also be set to "Release".
  local sdk='iphonesimulator'

  local app="./output/Build/Products/$config-$sdk/$scheme.app"
  local bundle_id="com.sleepytimebacon.$scheme"

  xcrun simctl install booted $app
  xcrun simctl launch booted $bundle_id
}

xb() {
  # If no scheme name is provided by the caller then
  # get the scheme name from the current directory.
  local scheme="$1"
  if [ -z $scheme ]; then
    scheme=$(basename "$(pwd)")
  fi

  local config='Debug'        # May also be set to "Release".
  local sdk='iphonesimulator'

  local data_path='./output'
  local platform='iOS Simulator'
  local device='iPhone 5s'
  local os='9.2'
  local dest="platform=$platform,name=$device,OS=$os"

  xctool -configuration $config      \
         -derivedDataPath $data_path \
         -destination $dest          \
         -reporter pretty            \
         -scheme $scheme             \
         -sdk $sdk                   \
         build
}

# Load/reload the simulator.
xl() {
  local device='iPhone 5s'
  local os='iOS 9.2'
  local udid=$(xcrun simctl list --json devices | jq ".devices.\"$os\" | .[] | select(.name==\"$device\") | .udid")
  xq
  open -a 'Simulator' --args -CurrentDeviceUDID $udid
}

# Quit the simulator.
xq() {
  local running=$(pgrep -x 'Simulator' | wc -l)
  if [ $running -gt 0 ]; then
    osascript -e 'quit app "Simulator"'
  fi
}

# Reset all the simulators.
# http://stackoverflow.com/a/33818402
xr() {
  xq
  xcrun simctl erase all
}

# ------------------------------------------------------------------------------

# if [ -f ~/My/Shell/laravel.sh ]; then
#   source ~/My/Shell/laravel.sh
# fi

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -f ~/.extra ]; then
  source ~/.extra
fi

# zsh-syntax-highlighting
# Provides syntax highlighting of commands as they are typed at the prompt.
# https://github.com/zsh-users/zsh-syntax-highlighting
# TODO
# - get this working

# export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# source /Users/ronmartinez/.zgen/zsh-users/zsh-syntax-highlighting-master/highlighters/main/main-highlighter.zsh
# source /Users/ronmartinez/.zgen/zsh-users/zsh-syntax-highlighting-master/zsh-syntax-highlighting.zsh
