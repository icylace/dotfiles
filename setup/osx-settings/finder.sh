e ''
e '-----------------------------------------------' $blue
e '-                   Finder                    -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.apple.finder'

e '\tDisplay full POSIX path in the title bar.'
dw _FXShowPosixPathInTitle -bool true

e '\tShow hidden files.'
dw AppleShowAllFiles -bool true

# e 'Hide Desktop icons.'
# dw CreateDesktop -bool false

e '\tDisable window animations and Get Info animations.'
dw DisableAllAnimations -bool true

# e '\tEmpty Trash securely by default.'
# dw EmptyTrashSecurely -bool true

e '\tWhen performing a search, search the current folder by default.'
dw FXDefaultSearchScope -string 'SCcf'

e '\tDisable the warning when changing a file extension.'
dw FXEnableExtensionChangeWarning -bool false

e '\tExpand the following File Info panes: "General", "Open with", and "Sharing & Permissions"'
dw FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

e '\tUse list view by default.'
dw FXPreferredViewStyle -string 'Nlsv'
# Possible values:
# - Nlsv = List View
# - icnv = Icon View (default)
# - clmv = Column View
# - Flwv = Cover Flow View

e '\tSet the Downloads folder as the default location for new Finder windows.'
dw NewWindowTarget -string 'PfLo'
dw NewWindowTargetPath -string "file://${HOME}/Downloads"
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
dw QLEnableTextSelection -bool true

e '\tEnable the menu option to quit Finder.'
dw QuitMenuItem -bool true
# Quitting Finder will also hide desktop icons.

e '\tShow icons for hard drives, mounted servers, and removable media on the desktop.'
dw ShowExternalHardDrivesOnDesktop -bool true
dw ShowHardDrivesOnDesktop -bool true
dw ShowMountedServersOnDesktop -bool true
dw ShowRemovableMediaOnDesktop -bool true

e '\tShow path bar.'
dw ShowPathbar -bool true

e '\tShow status bar.'
dw ShowStatusBar -bool true

e '\tDisable the warning before emptying the Trash.'
dw WarnOnEmptyTrash -bool false

# # Restart the Finder to apply the settings.
# killall Finder
