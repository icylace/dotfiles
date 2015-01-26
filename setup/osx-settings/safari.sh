e ''
e '-----------------------------------------------' $blue
e '-                   Safari                    -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.apple.Safari'

et 'Always show the tab bar.'
dw AlwaysShowTabBar -bool true

et 'Disable auto-fill.'
dw AllowBypassOfAutocompleteOff -int 0
dw AutoFillFromAddressBook -int 0
dw AutoFillPasswords -int 0
dw AutoFillCreditCardData -int 0
dw AutoFillMiscellaneousForms -int 0

et "Prevent Safari from opening 'safe' files automatically after downloading."
dw AutoOpenSafeDownloads -bool false

et 'Allow hitting the Backspace key to go to the previous page in history.'
dw com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

et 'Enable the Web Inspector.'
dw com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
dw WebKitDeveloperExtrasEnabledPreferenceKey -bool true

et 'Press Tab to highlight each item on a webpage.'
dw com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
dw WebKitTabToLinksPreferenceKey -bool true

et 'Disable thumbnail cache for History and Top Sites.'
dw DebugSnapshotsUpdatePolicy -int 2
# http://krypted.com/mac-os-x/disable-snapshot-caching-in-safari/

et 'Make search banners default to Contains instead of Starts With.'
dw FindOnPageMatchesWordStartsOnly -bool false

et "Set home page to 'about:blank' for faster loading."
dw HomePage -string 'about:blank'

et 'Enable the Develop menu.'
dw IncludeDevelopMenu -bool true

et 'Enable debug menu.'
dw IncludeInternalDebugMenu -bool true

et 'Remove icons from the bookmarks bar.'
dw ProxiesInBookmarksBar '()'
# http://krypted.com/mac-security/how-to-gain-about-half-an-inch-in-safari/

et 'Hide the bookmarks bar by default.'
dw ShowFavoritesBar -bool false

et 'Show the full URL in the address bar (note: this still hides the scheme).'
dw ShowFullURLInSmartSearchField -bool true

et 'Hide the sidebar in Top Sites.'
dw ShowSidebarInTopSites -bool false

et 'Show status bar.'
dw ShowStatusBar -bool true

et "Don't send search queries to Apple."
dw SuppressSearchSuggestions -bool true
dw UniversalSearchEnabled -bool false

et 'Open targeted click link in new tabs.'
dw TargetedClicksCreateTabs -bool true
# http://krypted.com/uncategorized/safari-tab-creation/
