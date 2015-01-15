e ''
e '###############################################' $blue
e '#                  TERMINAL                   #' $blue
e '###############################################' $blue
e ''

alias dw='defaults write com.apple.terminal'

e '\tOnly use UTF-8.'
dw StringEncodings -array 4
