e ''
e '###############################################' $blue
e '#                Transmission                 #' $blue
e '#             BitTorrent client.              #' $blue
e '#       https://www.transmissionbt.com/       #' $blue
e '###############################################' $blue
e ''

alias dw='defaults write org.m0k.transmission'

e "\tDon't prompt for confirmation before downloading."
dw DownloadAsk -bool false

e '\tUse a certain folder to store incomplete downloads.'
dw IncompleteDownloadFolder -string "${HOME}/Documents/_ torrents"
dw UseIncompleteDownloadFolder -bool true

e '\tHide the donate message.'
dw WarningDonate -bool false

e '\tHide the legal disclaimer.'
dw WarningLegal -bool false

# # Restart Transmission to apply the settings.
# killall Transmission
