e ''
e '###############################################' $blue
e '#                   FINDER                    #' $blue
e '###############################################' $blue
e ''

e '\tDisplay full POSIX path in the title bar.'
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

e '\tShow hidden files.'
defaults write com.apple.finder AppleShowAllFiles -bool true

# e 'Hide Desktop icons.'
# defaults write com.apple.finder CreateDesktop -bool false

e '\tDisable window animations and Get Info animations.'
defaults write com.apple.finder DisableAllAnimations -bool true

# e '\tEmpty Trash securely by default.'
# defaults write com.apple.finder EmptyTrashSecurely -bool true

e '\tWhen performing a search, search the current folder by default.'
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'

e '\tDisable the warning when changing a file extension.'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

e '\tExpand the following File Info panes: "General", "Open with", and "Sharing & Permissions"'
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

e '\tUse list view by default.'
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'
# Possible values:
# - Nlsv = List View
# - icnv = Icon View (default)
# - clmv = Column View
# - Flwv = Cover Flow View

e '\tSet the Downloads folder as the default location for new Finder windows.'
defaults write com.apple.finder NewWindowTarget -string 'PfLo'
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads"
# Possible values:
# https://github.com/mathiasbynens/dotfiles/pull/285#issuecomment-31608378
# Description - NewWindowTarget - NewWindowTargetPath
# Computer     - PfCm - None
# Volume       - PfVo - file:///
# Home         - PfHm - file://${HOME}/
# Desktop      - PfDe - file://${HOME}/Desktop/
# Documents    - PfDo - file://${HOME}/Documents/
# All My Files - PfAF - file:///System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearch
# Other path   - PfLo - file:///full/path/here/

e '\Enable text selection in the Quick Look window.'
defaults write com.apple.finder QLEnableTextSelection -bool true

e '\tEnable the menu option to quit Finder.'
defaults write com.apple.finder QuitMenuItem -bool true
# Quitting Finder will also hide desktop icons.

e '\tShow icons for hard drives, mounted servers, and removable media on the desktop.'
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

e '\tShow path bar.'
defaults write com.apple.finder ShowPathbar -bool true

e '\tShow status bar.'
defaults write com.apple.finder ShowStatusBar -bool true

e '\tDisable the warning before emptying the Trash.'
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# # Restart the Finder to apply the settings.
# killall Finder
