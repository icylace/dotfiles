# ------------------------------------------------------------------------------
#  Transmission
#  BitTorrent client.
#  https://www.transmissionbt.com/
# ------------------------------------------------------------------------------

e "\tDon't prompt for confirmation before downloading."
defaults write org.m0k.transmission DownloadAsk -bool false

e '\tUse a certain folder to store incomplete downloads.'
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/_ torrents"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true

e '\tHide the donate message.'
defaults write org.m0k.transmission WarningDonate -bool false

e '\tHide the legal disclaimer.'
defaults write org.m0k.transmission WarningLegal -bool false

# # Restart Transmission to apply the settings.
# killall Transmission
