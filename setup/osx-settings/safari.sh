# ------------------------------------------------------------------------------
#  Safari settings.
# ------------------------------------------------------------------------------

# echo "\tPrevent Safari from opening ‘safe’ files automatically after downloading."
# defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

echo '\tAllow hitting the Backspace key to go to the previous page in history.'
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

echo '\tEnable the Develop menu and the Web Inspector in Safari.'
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

# http://krypted.com/mac-os-x/disable-snapshot-caching-in-safari/
echo "\tDisable Safari's thumbnail cache for History and Top Sites."
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo "\tMake Safari’s search banners default to Contains instead of Starts With."
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo "\tSet Safari's home page to \"about:blank\" for faster loading."
defaults write com.apple.Safari HomePage -string 'about:blank'

echo "\tEnable Safari's debug menu."
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo '\tRemove useless icons from the bookmarks bar.'
defaults write com.apple.Safari ProxiesInBookmarksBar '()'

echo '\tHide the bookmarks bar by default.'
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo '\tShow the full URL in the address bar (note: this still hides the scheme).'
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

echo '\tShow status bar.'
defaults write com.apple.Safari ShowStatusBar -bool true

echo "\tDon't send search queries to Apple."
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari UniversalSearchEnabled -bool false

echo '\tOpen targeted click link in new tabs.'
defaults write com.apple.Safari TargetedClicksCreateTabs -bool true
