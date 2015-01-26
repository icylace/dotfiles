e ''
e '-----------------------------------------------' $blue
e '-                   Finder                    -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.apple.finder'

et 'Display full POSIX path in the title bar.'
dw _FXShowPosixPathInTitle -bool true

et 'Show hidden files.'
dw AppleShowAllFiles -bool true

# et 'Hide Desktop icons.'
# dw CreateDesktop -bool false

et 'Disable window animations and Get Info animations.'
dw DisableAllAnimations -bool true

# et 'Empty Trash securely by default.'
# dw EmptyTrashSecurely -bool true

et 'When performing a search, search the current folder by default.'
dw FXDefaultSearchScope -string 'SCcf'

et 'Disable the warning when changing a file extension.'
dw FXEnableExtensionChangeWarning -bool false

et 'Expand the following File Info panes: "General", "Open with", and "Sharing & Permissions"'
dw FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

et 'Use list view by default.'
dw FXPreferredViewStyle -string 'Nlsv'
# Possible values:
# - Nlsv = List View
# - icnv = Icon View (default)
# - clmv = Column View
# - Flwv = Cover Flow View

et 'Set the Downloads folder as the default location for new Finder windows.'
dw NewWindowTarget -string 'PfLo'
dw NewWindowTargetPath -string "file://${HOME}/Downloads"
# Possible values:
# https://github.com/mathiasbynens/dotfiles/pull/285#issuecomment-31608378
# Description  - NewWindowTarget - NewWindowTargetPath
# Computer     - PfCm - None
# Volume       - PfVo - file:///
# Home         - PfHm - file://${HOME}/
# Desktop      - PfDe - file://${HOME}/Desktop/
# Documents    - PfDo - file://${HOME}/Documents/
# All My Files - PfAF - file:///System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearch
# Other path   - PfLo - file:///full/path/here/

et 'Enable text selection in the Quick Look window.'
dw QLEnableTextSelection -bool true

et 'Enable the menu option to quit Finder.'
dw QuitMenuItem -bool true
# Quitting Finder will also hide desktop icons.

et 'Show icons for hard drives, mounted servers, and removable media on the desktop.'
dw ShowExternalHardDrivesOnDesktop -bool true
dw ShowHardDrivesOnDesktop -bool true
dw ShowMountedServersOnDesktop -bool true
dw ShowRemovableMediaOnDesktop -bool true

et 'Show path bar.'
dw ShowPathbar -bool true

et 'Show status bar.'
dw ShowStatusBar -bool true

et 'Disable the warning before emptying the Trash.'
dw WarnOnEmptyTrash -bool false

# # Restart the Finder to apply the settings.
# killall Finder
