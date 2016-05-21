#!/usr/bin/env zsh

#
# Shows the battery charge status.
#
# Based on:
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#my-right-prompt-battery-capacity
# https://gist.github.com/ascarter/1181082
# http://stackoverflow.com/a/1025352/1935675
#
battery_indicator() {
  local slots_total=10
  local symbol_filled='✿'
  local symbol_unfilled='❀'

  local threshold_medium=60
  local threshold_low=40

  local battery_percent=$(echo $(pmset -g batt) | grep --only-matching '[0-9]\+%')
  local battery_number=${battery_percent:0:-1}
  local scaled_battery=$((battery_number * slots_total / 100.0))
  local slots_filled=$(printf %.0f scaled_battery)
  local slots_empty=$((slots_total - slots_filled))
  local indicator_filled=$(printf "$symbol_filled%.0s" $(seq 1 $slots_filled))
  local indicator_unfilled=$(printf "$symbol_unfilled%.0s" $(seq 1 $slots_empty))

  local color=''
  if [ $battery_number -gt $threshold_medium ] ; then
    color='green'
  elif [ $battery_number -gt $threshold_low ] ; then
    color='yellow'
  else
    color='red'
  fi

  echo "%{$fg[$color]%}$indicator_filled$indicator_unfilled%{$reset_color%}"
}
