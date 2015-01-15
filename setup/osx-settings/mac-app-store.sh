e ''
e '###############################################' $blue
e '#                MAC APP STORE                #' $blue
e '###############################################' $blue
e ''

alias dw='defaults write com.apple.appstore'

e '\tEnable Debug Menu in the Mac App Store.'
dw ShowDebugMenu -bool true

e '\tEnable the WebKit Developer Tools in the Mac App Store.'
dw WebKitDeveloperExtras -bool true
