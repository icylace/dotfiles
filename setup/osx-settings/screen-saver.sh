e ''
e '-----------------------------------------------' $blue
e '-                Screen Saver                 -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.apple.screensaver'

et 'Require password immediately after sleep or screensaver begins.'
dw askForPassword -int 1
dw askForPasswordDelay -int 0
