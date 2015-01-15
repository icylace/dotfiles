e ''
e '###############################################' $blue
e '#                   SAFARI                    #' $blue
e '###############################################' $blue
e ''

alias dw='defaults write com.apple.Safari'

e '\tAlways show the tab bar.'
dw AlwaysShowTabBar -bool true

e '\tDisable auto-fill.'
dw AllowBypassOfAutocompleteOff -int 0
dw AutoFillFromAddressBook -int 0
dw AutoFillPasswords -int 0
dw AutoFillCreditCardData -int 0
dw AutoFillMiscellaneousForms -int 0

e "\tPrevent Safari from opening 'safe' files automatically after downloading."
dw AutoOpenSafeDownloads -bool false

e '\tAllow hitting the Backspace key to go to the previous page in history.'
dw com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

e '\tEnable the Web Inspector.'
dw com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
dw WebKitDeveloperExtrasEnabledPreferenceKey -bool true

e '\tPress Tab to highlight each item on a webpage.'
dw com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
dw WebKitTabToLinksPreferenceKey -bool true

e '\tDisable thumbnail cache for History and Top Sites.'
dw DebugSnapshotsUpdatePolicy -int 2
# http://krypted.com/mac-os-x/disable-snapshot-caching-in-safari/

e '\tMake search banners default to Contains instead of Starts With.'
dw FindOnPageMatchesWordStartsOnly -bool false

e "\tSet home page to 'about:blank' for faster loading."
dw HomePage -string 'about:blank'

e '\tEnable the Develop menu.'
dw IncludeDevelopMenu -bool true

e '\tEnable debug menu.'
dw IncludeInternalDebugMenu -bool true

e '\tRemove icons from the bookmarks bar.'
dw ProxiesInBookmarksBar '()'
# http://krypted.com/mac-security/how-to-gain-about-half-an-inch-in-safari/

e '\tHide the bookmarks bar by default.'
dw ShowFavoritesBar -bool false

e '\tShow the full URL in the address bar (note: this still hides the scheme).'
dw ShowFullURLInSmartSearchField -bool true

e '\tHide the sidebar in Top Sites.'
dw ShowSidebarInTopSites -bool false

e '\tShow status bar.'
dw ShowStatusBar -bool true

e "\tDon't send search queries to Apple."
dw SuppressSearchSuggestions -bool true
dw UniversalSearchEnabled -bool false

e '\tOpen targeted click link in new tabs.'
dw TargetedClicksCreateTabs -bool true
# http://krypted.com/uncategorized/safari-tab-creation/
