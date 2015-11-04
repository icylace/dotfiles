#!/usr/bin/env bash

ceil() {
  # ZSH-only.
  printf %.0f "$1 + 0.5"
}

# This is meant to be used for the prompt.
#
# Based on:
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#my-right-prompt-battery-capacity
# https://gist.github.com/ascarter/1181082
battery_charge() {
  total_slots=10
  battery_info=$(ioreg -rc AppleSmartBattery)
  battery_max=$(echo $battery_info | grep MaxCapacity | grep --only-matching --extended-regexp '[0-9]+')
  battery_cur=$(echo $battery_info | grep CurrentCapacity | grep --only-matching --extended-regexp '[0-9]+')



# WIP





  charge=$(echo "$total_slots * $battery_cur / $battery_max" | bc -l | ceil)
  echo $charge




# WIP


      # Output

      filled = int(math.ceil(charge_threshold * (float(total_slots) / 8.0))) * u'✿'
      empty  = (total_slots - len(filled)) * u'❀'
      output = (filled + empty).encode('utf-8')

      medium_threshold = int(math.floor(float(total_slots) * 0.6))
      low_threshold    = int(math.floor(float(total_slots) * 0.4))

      if args.color is True:
          color_green  = '%{[32m%}'
          color_yellow = '%{[1;33m%}'
          color_red    = '%{[31m%}'
          color_reset  = '%{[00m%}'
          color_output = (
              color_green if len(filled) > medium_threshold else
              color_yellow if len(filled) > low_threshold else
              color_red
          )

  local output=color_output + output + color_reset

  echo $output
}
