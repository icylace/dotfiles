e ''
e '-----------------------------------------------' $blue
e '-                Transmission                 -' $blue
e '-             BitTorrent client.              -' $blue
e '-       https://www.transmissionbt.com/       -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write org.m0k.transmission'

et "Don't prompt for confirmation before downloading."
dw DownloadAsk -bool false

et 'Use a certain folder to store incomplete downloads.'
dw IncompleteDownloadFolder -string "${HOME}/Downloads/_ torrents"
dw UseIncompleteDownloadFolder -bool true

et 'Hide the donate message.'
dw WarningDonate -bool false

et 'Hide the legal disclaimer.'
dw WarningLegal -bool false

# # Restart Transmission to apply the settings.
# killall Transmission
