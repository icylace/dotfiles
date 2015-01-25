e ''
e '-----------------------------------------------' $blue
e '-                Mac App Store                -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.apple.appstore'

et 'Enable Debug Menu in the Mac App Store.'
dw ShowDebugMenu -bool true

et 'Enable the WebKit Developer Tools in the Mac App Store.'
dw WebKitDeveloperExtras -bool true
