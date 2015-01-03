# ------------------------------------------------------------------------------
#  Mac App Store settings.
# ------------------------------------------------------------------------------

echo '\tEnable Debug Menu in the Mac App Store.'
defaults write com.apple.appstore ShowDebugMenu -bool true

echo '\tEnable the WebKit Developer Tools in the Mac App Store.'
defaults write com.apple.appstore WebKitDeveloperExtras -bool true
