e ''
e '-----------------------------------------------' $blue
e '-                  Text Edit                  -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.apple.TextEditw'

et 'Open and save files as UTF-8.'
dw PlainTextEncoding -int 4
dw PlainTextEncodingForWrite -int 4

et 'Use plain text mode for new documents.'
dw RichText -int 0
