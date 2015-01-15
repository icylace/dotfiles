e ''
e '###############################################' $blue
e '#                  TEXT EDIT                  #' $blue
e '###############################################' $blue
e ''

alias dw='defaults write com.apple.TextEditw'

e '\tOpen and save files as UTF-8.'
dw PlainTextEncoding -int 4
dw PlainTextEncodingForWrite -int 4

e '\tUse plain text mode for new documents.'
dw RichText -int 0
