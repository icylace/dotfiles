# ------------------------------------------------------------------------------
#  Transmission
#  BitTorrent client.
#  https://www.transmissionbt.com/
# ------------------------------------------------------------------------------

echo "\tDon’t prompt for confirmation before downloading."
defaults write org.m0k.transmission DownloadAsk -bool false

echo '\tUse a certain folder to store incomplete downloads.'
defaults write org.m0k.transmission IncompleteDownloadFolder -string '~/Documents/_ torrents'
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true

echo '\tHide the donate message.'
defaults write org.m0k.transmission WarningDonate -bool false

echo '\tHide the legal disclaimer.'
defaults write org.m0k.transmission WarningLegal -bool false

# # Restart Transmission to apply the settings.
# killall Transmission
