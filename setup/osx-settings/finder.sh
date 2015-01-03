# ------------------------------------------------------------------------------
#  Finder settings.
# ------------------------------------------------------------------------------

# Case is different in finder plist starting in 10.9 (Mavericks).
case ${OSTYPE} in
  darwin10*) finder='Finder';;
  darwin11*) finder='Finder';;
  darwin12*) finder='Finder';;
  darwin13*) finder='finder';;
esac

echo '\tDisplay full POSIX path in the title bar.'
defaults write com.apple.$finder _FXShowPosixPathInTitle -bool true

echo '\tShow hidden files.'
defaults write com.apple.$finder AppleShowAllFiles -bool true

# echo 'Hide Desktop icons.'
# defaults write com.apple.$finder CreateDesktop -bool false

echo '\tDisable window animations and Get Info animations.'
defaults write com.apple.$finder DisableAllAnimations -bool true

# echo '\tEmpty Trash securely by default.'
# defaults write com.apple.$finder EmptyTrashSecurely -bool true

echo '\tWhen performing a search, search the current folder by default.'
defaults write com.apple.$finder FXDefaultSearchScope -string 'SCcf'

echo '\tDisable the warning when changing a file extension.'
defaults write com.apple.$finder FXEnableExtensionChangeWarning -bool false

echo '\tUse list view by default.'
defaults write com.apple.$finder FXPreferredViewStyle -string 'Nlsv'
# - Nlsv = List View
# - icnv = Icon View (default)
# - clmv = Column View
# - Flwv = Cover Flow View

# echo '\tSetting home folder as the default location for new Finder windows.'
# defaults write com.apple.$finder NewWindowTarget -string 'PfLo'
# defaults write com.apple.$finder NewWindowTargetPath -string "file://${HOME}/"

echo '\Enable text selection in the Quick Look window.'
defaults write com.apple.$finder QLEnableTextSelection -bool true

echo '\tEnable the menu option to quit Finder.'
defaults write com.apple.$finder QuitMenuItem -bool true
# Quitting Finder will also hide desktop icons.

echo '\tShow icons for hard drives, mounted servers, and removable media on the desktop.'
defaults write com.apple.$finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.$finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.$finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.$finder ShowRemovableMediaOnDesktop -bool true

echo '\tShow path bar.'
defaults write com.apple.$finder ShowPathbar -bool true

echo '\tShow status bar.'
defaults write com.apple.$finder ShowStatusBar -bool true

echo '\tDisable the warning before emptying the Trash.'
defaults write com.apple.$finder WarnOnEmptyTrash -bool false

# # Restart the Finder to apply the settings.
# killall Finder
