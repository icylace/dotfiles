#!/usr/bin/env zsh

source "$HOME/.my/battery.zsh"

setopt PROMPT_SUBST


#
# Based on:
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# https://blog.munge.net/post/fun-with-zsh-themes/
# http://justin.jetfive.com/2012/12/01/my-new-zsh-theme.html
#

select_prompt_char() {
  setopt local_options KSH_ARRAYS

  local prompt_chars=(
    'λ'    # U+03BB: greek small letter lamda
    '९'    # U+096F: devanagari digit nine
    '২'    # U+09E8: bengali digit two
    '৶'    # U+09F6: bengali currency numerator three
    'ઑ'    # U+0A91: gujarati vowel candra o
    'త'    # U+0C24: telugu letter ta
    'ຯ'    # U+0EAF: lao ellipsis
    '᠁'    # U+1801: mongolian ellipsis
    '…'    # U+2026: horizontal ellipsis
    '⁘'    # U+2058: four dot punctuation
    '→'    # U+2192: rightwards arrow
    '⋮'    # U+22EE: vertical ellipsis
    '⋯'    # U+22EF: midline horizontal ellipsis
    '⋰'    # U+22F0: up right diagonal ellipsis
    '⋱'    # U+22F1: down right diagonal ellipsis
    '⌖'    # U+2316: position indicator
    '␥'    # U+2425: symbol for delete form two
    '⑀'    # U+2440: ocr hook
    '⑁'    # U+2441: ocr chair
    '⑂'    # U+2442: ocr fork
    '⑃'    # U+2443: ocr inverted fork
    '⑄'    # U+2444: ocr belt buckle
    '⑅'    # U+2445: ocr bow tie
    '⑆'    # U+2446: ocr branch bank identification
    '⑇'    # U+2447: ocr amount of check
    '⑈'    # U+2448: ocr dash
    '⑉'    # U+2449: ocr customer account number
    '⑊'    # U+244A: ocr double backslash
    '★'    # U+2605: black star
    '☙'    # U+2619: reversed rotated floral heart bullet
    '☾'    # U+263E: last quarter moon
    '♘'    # U+2658: white chess knight
    '♞'    # U+265E: black chess knight

    # From the Dingbats Unicode block:
    '✙'    # U+2719: outlined greek cross
    '✚'    # U+271A: heavy greek cross
    '✛'    # U+271B: open centre cross
    '✜'    # U+271C: heavy open centre cross
    '✢'    # U+2722: four teardrop-spoked asterisk
    '✣'    # U+2723: four balloon-spoked asterisk
    '✤'    # U+2724: heavy four balloon-spoked asterisk
    '✥'    # U+2725: four club-spoked asterisk
    '✦'    # U+2726: black four pointed star
    '✧'    # U+2727: white four pointed star
    '✩'    # U+2729: stress outlined white star
    '✪'    # U+272A: circled white star
    '✫'    # U+272B: open centre black star
    '✬'    # U+272C: black centre white star
    '✭'    # U+272D: outlined black star
    '✮'    # U+272E: heavy outlined black star
    '✯'    # U+272F: pinwheel star
    '✰'    # U+2730: shadowed white star
    '✱'    # U+2731: heavy asterisk
    '✲'    # U+2732: open centre asterisk
    '✳'    # U+2733: eight spoked asterisk
    '✴'    # U+2734: eight pointed black star
    '✵'    # U+2735: eight pointed pinwheel star
    '✶'    # U+2736: six pointed black star
    '✷'    # U+2737: eight pointed rectilinear black star
    '✸'    # U+2738: heavy eight pointed rectilinear black star
    '✹'    # U+2739: twelve pointed black star
    '✺'    # U+273A: sixteen pointed asterisk
    '✻'    # U+273B: teardrop-spoked asterisk
    '✼'    # U+273C: open centre teardrop-spoked asterisk
    '✽'    # U+273D: heavy teardrop-spoked asterisk
    '✾'    # U+273E: six petalled black and white florette
    '✿'    # U+273F: black florette
    '❀'    # U+2740: white florette
    '❁'    # U+2741: eight petalled outlined black florette
    '❂'    # U+2742: circled open centre eight pointed star
    '❃'    # U+2743: heavy teardrop-spoked pinwheel asterisk
    '❄'    # U+2744: snowflake
    '❅'    # U+2745: tight trifoliate snowflake
    '❆'    # U+2746: heavy chevron snowflake
    '❇'    # U+2747: sparkle
    '❈'    # U+2748: heavy sparkle
    '❉'    # U+2749: balloon-spoked asterisk
    '❊'    # U+274A: eight teardrop-spoked propeller asterisk
    '❋'    # U+274B: heavy eight teardrop-spoked propeller asterisk
    '❖'    # U+2756: black diamond minus white x
    '❝'    # U+275D: heavy double turned comma quotation mark ornament
    '❦'    # U+2766: floral heart
    '❧'    # U+2767: rotated floral heart bullet
    '❭'    # U+276D: medium right-pointing angle bracket ornament
    '❯'    # U+276F: heavy right-pointing angle quotation mark ornament
    '❱'    # U+2771: heavy right-pointing angle bracket ornament
    '➔'    # U+2794: heavy wide-headed rightwards arrow
    '➘'    # U+2798: heavy south east arrow
    '➙'    # U+2799: heavy rightwards arrow
    '➚'    # U+279A: heavy north east arrow
    '➛'    # U+279B: drafting point rightwards arrow
    '➜'    # U+279C: heavy round-tipped rightwards arrow
    '➝'    # U+279D: triangle-headed rightwards arrow
    '➞'    # U+279E: heavy triangle-headed rightwards arrow
    '➟'    # U+279F: dashed triangle-headed rightwards arrow
    '➠'    # U+27A0: heavy dashed triangle-headed rightwards arrow
    '➡'    # U+27A1: black rightwards arrow
    '➢'    # U+27A2: three-d top-lighted rightwards arrowhead
    '➣'    # U+27A3: three-d bottom-lighted rightwards arrowhead
    '➤'    # U+27A4: black rightwards arrowhead
    '➥'    # U+27A5: heavy black curved downwards and rightwards arrow
    '➦'    # U+27A6: heavy black curved upwards and rightwards arrow
    '➧'    # U+27A7: squat black rightwards arrow
    '➨'    # U+27A8: heavy concave-pointed black rightwards arrow
    '➩'    # U+27A9: right-shaded white rightwards arrow
    '➪'    # U+27AA: left-shaded white rightwards arrow
    '➫'    # U+27AB: back-tilted shadowed white rightwards arrow
    '➬'    # U+27AC: front-tilted shadowed white rightwards arrow
    '➭'    # U+27AD: heavy lower right-shadowed white rightwards arrow
    '➮'    # U+27AE: heavy upper right-shadowed white rightwards arrow
    '➯'    # U+27AF: notched lower right-shadowed white rightwards arrow
    '➱'    # U+27B1: notched upper right-shadowed white rightwards arrow
    '➳'    # U+27B3: white-feathered rightwards arrow
    '➴'    # U+27B4: black-feathered south east arrow
    '➵'    # U+27B5: black-feathered rightwards arrow
    '➶'    # U+27B6: black-feathered north east arrow
    '➷'    # U+27B7: heavy black-feathered south east arrow
    '➸'    # U+27B8: heavy black-feathered rightwards arrow
    '➹'    # U+27B9: heavy black-feathered north east arrow
    '➺'    # U+27BA: teardrop-barbed rightwards arrow
    '➻'    # U+27BB: heavy teardrop-shanked rightwards arrow
    '➼'    # U+27BC: wedge-tailed rightwards arrow
    '➽'    # U+27BD: heavy wedge-tailed rightwards arrow
    '➾'    # U+27BE: open-outlined rightwards arrow

    '⸚'    # U+2E1A: hyphen with diaeresis
    '︙'    # U+FE19: presentation form for vertical horizontal ellipsis
    '𝛌'    # U+1D6CC: mathematical bold small lamda
    '𝝺'    # U+1D77A: mathematical sans-serif bold small lamda
  )

  # Select a random prompt character.
  echo "${prompt_chars[$((RANDOM % ${#prompt_chars[@]}))]}"
}


select_exit_status_char() {
  setopt local_options KSH_ARRAYS

  local exit_status_chars=(
    '↵'    # U+21B5: downwards arrow with corner leftwards
    '∠'    # U+2220: angle
    '∢'    # U+2222: spherical angle
    '⏎'    # U+23CE: return symbol
    '✘'    # U+2718: heavy ballot x
  )

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
  # current directory, any Git info, and battery charge.
  # https://stackoverflow.com/a/33839913/1935675
  local preprompt_left="$N%F{magenta}%n %B%F{black}at%b %F{yellow}%m %B%F{black}in %b%F{green}${PWD/#$HOME/~}%f $(git-radar --zsh --fetch)"
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
  echo "$fg[black]$(date +%r)$reset_color"
}


export GIT_RADAR_COLOR_BRANCH="%B%F{cyan}"

# Our custom Git Radar prompt is a slight modification of the default one.
# https://github.com/michaeldfallen/git-radar/blob/master/radar-base.sh#L99
export GIT_RADAR_FORMAT="%B%F{black}on git:(%b%f%{remote: }%{branch}%{ :local}%B%F{black})%b%f%{ :stash}%{ :changes}"

# The second part of our prompt contains the exit status code,
# user input marker, and the date and time.
export PROMPT='%(?..%F{red}$EXIT_STATUS_CHAR %B%?$N%b%f)%B%F{magenta}$PROMPT_CHAR%b%f  '
export RPROMPT='%B%F{black}%D{%L:%M:%S %p %Z ∴ %m-%d ∴ %Y}%b%f'


# # TODO
# # - check if TMOUT will prematurely terminate scripts that wait for input
# #   - http://www.thegeekstuff.com/2010/05/tmout-exit-bash-shell-when-no-activity/#comment-46144
# #   - http://h30499.www3.hp.com/t5/Languages-and-Scripting/TMOUT-cause-scripts-end/m-p/5249728#M40881
# #   - http://h30499.www3.hp.com/t5/Languages-and-Scripting/TMOUT-cause-scripts-end/m-p/5249732#M40885
# TMOUT=1

# # https://askubuntu.com/a/360172
# # https://github.com/robbyrussell/oh-my-zsh/issues/5910
# # https://github.com/robbyrussell/oh-my-zsh/issues/5910#issuecomment-294509017
# TRAPALRM() {
#   if [[ $WIDGET != *"complete"* && $WIDGET != *"beginning-search" ]] ; then
#     zle reset-prompt
#   fi
# }
