# ------------------------------------------------------------------------------
#  Safari settings.
# ------------------------------------------------------------------------------

echo '\tAlways show the tab bar.'
defaults write com.apple.Safari AlwaysShowTabBar -bool true

echo '\tDisable auto-fill.'
defaults write com.apple.Safari AllowBypassOfAutocompleteOff -int 0
defaults write com.apple.Safari AutoFillFromAddressBook -int 0
defaults write com.apple.Safari AutoFillPasswords -int 0
defaults write com.apple.Safari AutoFillCreditCardData -int 0
defaults write com.apple.Safari AutoFillMiscellaneousForms -int 0

echo "\tPrevent Safari from opening 'safe' files automatically after downloading."
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

echo '\tAllow hitting the Backspace key to go to the previous page in history.'
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

echo '\tEnable the Web Inspector.'
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

echo '\tPress Tab to highlight each item on a webpage.'
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true

echo '\tDisable thumbnail cache for History and Top Sites.'
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
# http://krypted.com/mac-os-x/disable-snapshot-caching-in-safari/

echo '\tMake search banners default to Contains instead of Starts With.'
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo "\tSet home page to 'about:blank' for faster loading."
defaults write com.apple.Safari HomePage -string 'about:blank'

echo '\tEnable the Develop menu.'
defaults write com.apple.Safari IncludeDevelopMenu -bool true

echo '\tEnable debug menu.'
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo '\tRemove icons from the bookmarks bar.'
defaults write com.apple.Safari ProxiesInBookmarksBar '()'
# http://krypted.com/mac-security/how-to-gain-about-half-an-inch-in-safari/

echo '\tHide the bookmarks bar by default.'
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo '\tShow the full URL in the address bar (note: this still hides the scheme).'
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

echo '\tHide the sidebar in Top Sites.'
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

echo '\tShow status bar.'
defaults write com.apple.Safari ShowStatusBar -bool true

echo "\tDon't send search queries to Apple."
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari UniversalSearchEnabled -bool false

echo '\tOpen targeted click link in new tabs.'
defaults write com.apple.Safari TargetedClicksCreateTabs -bool true
# http://krypted.com/uncategorized/safari-tab-creation/
