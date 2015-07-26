e ''
e '-----------------------------------------------' $blue
e '-                  Bartender                  -' $blue
e '-              Menu bar manager.              -' $blue
e '-         http://www.macbartender.com/        -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.surteesstudios.Bartender'

et 'Show the menu bar icon.'
dw showMenuBarIcon -bool true

et 'Make sure the menu bar icon is the bartender.'
dw statusBarImageNamed -string 'Bartender'
