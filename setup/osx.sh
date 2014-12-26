#!/usr/bin/env bash

#
# Sets up OS X defaults that I like.
#
# To use, open up ~/Applications/Utilities/Terminal then run:
#
#     bash <(curl -s https://raw.githubusercontent.com/icylace/dotfiles/master/setup/osx-defaults.sh)
#
# Use `defaults delete {domain} {key}` to undo settings.  For example, using:
# `defaults write com.apple.dock expose-animation-duration -float 0.1` can be
# using `defaults delete com.apple.dock expose-animation-duration`.
#
# Heavy influence (and sometimes direct copying) from:
# - https://mths.be/osx
# - https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
# - http://www.defaults-write.com/
#

#
# http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# https://github.com/kevinrenskers/dotfiles
#

# Always show the user's Library folder.
chflags nohidden ~/Library/


# Disable the animations for opening Quick Look windows.
defaults write -g QLPanelAnimationDuration -float 0

# Display ASCII control characters in caret notation.
defaults write -g NSTextShowsControlCharacters -bool true

# # Don’t blink the cursor caret (value is in milliseconds).
# defaults write -g NSTextInsertionPointBlinkPeriod -int 9999999999999999

# # Use a lighter text rendering style.
# # http://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/#comment-435634
# defaults write -g AppleFontSmoothing -int 1

# # Disable auto-save in AppleScript Editor.
# # http://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/#comment-435634
# defaults write com.apple.ScriptEditor2 ApplePersistence -bool false




# ------------------------------------------------------------------------------
#  Dock settings.  Normally we would use `killall Dock` to apply
#  the settings but here we'll restart the system instead.
# ------------------------------------------------------------------------------

# Remove the delay for the Dock auto-hiding and auro-showing.
defaults write com.apple.Dock autohide-delay -float 0

# Show icons from hidden application translucent in OS X Dock.
defaults write com.apple.dock showhidden -bool true

# Disable the Dashboard.
defaults write com.apple.dashboard mcx-disabled -bool true

# Disable Spaces animation.
defaults write com.apple.dock workspaces-swoosh-animation-off -bool true

# Speed Up Mission Control Animations
defaults write com.apple.dock expose-animation-duration -float 0.1


# ------------------------------------------------------------------------------
#  Finder settings.  Normally we would use `killall Finder` to apply
#  the settings but here we'll restart the system instead.
# ------------------------------------------------------------------------------

# Allow text selection in the Quick Look window.
defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path in Finder's title bar.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable window animations Finder.
defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files in Finder.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Change default view style in Finder.
# - Nlsv = List View
# - icnv = Icon View (default)
# - clmv = Column View
# - Flwv = Cover Flow View
defaults write com.apple.finder FXPreferredViewStyle Nlsv

# Disable the extension change warning in Finder.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Display all file extensions in Finder.
defaults write -g AppleShowAllExtensions -bool true


# ------------------------------------------------------------------------------
#  Notification Center settings.
# ------------------------------------------------------------------------------

# Disable Notification Center.
defaults write /System/Library/LaunchAgents/com.apple.notificationcenterui KeepAlive -bool false

# # Restart Notification Center to apply the settings.
# killall NotificationCenter


# ------------------------------------------------------------------------------
#  System settings.  The require a system restart.
# ------------------------------------------------------------------------------

# # Change the default backup periods in Time Machine.
# sudo defaults write /System/Library/Launch\ Daemons/com.apple.backupd-auto StartInterval -int 1800

# Change the frequency (in days) of software update checks.
defaults write /Library/Preferences/com.apple.SoftwareUpdate ScheduleFrequency 1

# Disable 'Resume' system-wide.
defaults write -g NSQuitAlwaysKeepsWindows -bool false

# Disable auto-correction.
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Display additional information on the login screen.
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# # Change How Long (in seconds) Notification Banners Persist for in OS X
# defaults write com.apple.notificationcenterui bannerTime [time in seconds]

# Re-enable the repeat key feature.
defaults write -g ApplePressAndHoldEnabled -bool false

# Increase the speed of dialogs boxes.
defaults write -g NSWindowResizeTime .1

# Disable the creation of .DS_store files on network volumes.
# http://support.apple.com/en-us/ht1629
# http://www.chrisnovoa.com/os-x-lion-ds_store-disabling/
# http://www.defaults-write.com/disable-the-creation-of-ds_store-files/
# http://apple.stackexchange.com/questions/107969/single-purpose-app-to-prevent-ds-store-creation-under-mavericks#comment126770_108064
# https://www.aorensoftware.com/blog/2011/12/24/death-to-ds_store/
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable Dark Mode.
defaults write -g AppleInterfaceStyle Dark
# sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark
# sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Light








# Disable sound effect on boot.
# http://osxdaily.com/2012/11/04/disable-mac-boot-chime/
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Why the sound effect is useful:
# https://discussions.apple.com/message/16577746#16577746#16577746
#
# This no longer works in Yosemite.
sudo nvram SystemAudioVolume=' '
# sudo nvram -d SystemAudioVolume






# Change the default location for screenshots in Mac OS X.
# defaults write com.apple.screencapture location [path]
# defaults write com.apple.screencapture location ~/Desktop
# killall SystemUIServer

# Add a message to the login screen.
# sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Your Message"
# sudo defaults delete /Library/Preferences/com.apple.loginwindow LoginwindowText

# Display the location path of current wallpaper in OS X
# defaults write com.apple.dock desktop-picture-show-debug-text -bool TRUE
# defaults delete com.apple.dock desktop-picture-show-debug-text
# killall Dock

# http://www.defaults-write.com/safari-highlight-non-retina-images/


# # Disable ‘press and hold’ option in Mac OS X 10.7+.
# defaults write -g ApplePressAndHoldEnabled -bool false


# Reboot the system to ensure all settings take effect.
sudo shutdown -r now 'Rebooting now...'


#
# Other stuff...
#

# Hidden wallpapers.
# /Library/Screen Savers/Default Collections
