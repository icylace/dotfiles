# ------------------------------------------------------------------------------
#  Mac App Store settings.
# ------------------------------------------------------------------------------

e '\tEnable Debug Menu in the Mac App Store.'
defaults write com.apple.appstore ShowDebugMenu -bool true

e '\tEnable the WebKit Developer Tools in the Mac App Store.'
defaults write com.apple.appstore WebKitDeveloperExtras -bool true
