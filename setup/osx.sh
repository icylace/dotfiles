# ------------------------------------------------------------------------------
#  Set OS X defaults that I like.
# ------------------------------------------------------------------------------
#
# Use `defaults delete {domain} {key}` to undo settings.  For example, using:
# `defaults write com.apple.dock expose-animation-duration -float 0.1` can be
# using `defaults delete com.apple.dock expose-animation-duration`.
#
#  Heavy influence and much direct copying from:
#  - https://mths.be/osx
#  - http://lifehacker.com/how-to-make-your-own-bulk-app-installer-for-os-x-1586252163
#  - http://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/#comment-435634
#  - https://github.com/virtualswede/osx-bootstrap
#  - http://macguide.org/
#  - https://github.com/mikker/dotfiles/blob/master/osx
#  - https://github.com/RStankov/config_files/blob/master/dot/osx
#  - https://github.com/divio/osx-bootstrap/blob/master/core/defaults.sh
#  - https://github.com/ymendel/dotfiles/tree/master/osx
#  - http://www.tekrevue.com/tip/the-complete-guide-to-customizing-mac-os-xs-dock-with-terminal/
#  - https://gist.github.com/nicerobot/1193218
#  - http://secrets.blacktree.com/edit?id=238762
#  - https://gist.github.com/zenspider/8ee55e7c00b9201dd84f
#  - http://www.maclife.com/article/howtos/how-to-customize-dock
#  - http://jasahackintosh.wordpress.com/2014/09/04/tweak-os-x-from-command-terminal/
#  - https://github.com/trusche/dotfiles/blob/master/osx
#  - http://www.roaminggenius.com/blog/os-x-tip-resetting-launchpad-layout/
#  - http://wp.secretnest.info/archives/3129
#  - http://www.amsys.co.uk/2013/blog/how-to-enable-mission-control-to-display-full-size-previews/#.VKextGTF_yU
#

# Hidden wallpapers.
# /Library/Screen Savers/Default Collections

# # Set the computer name.
# sudo systemsetup -setcomputername {{computername}}

# # Reboot the system to ensure all settings take effect.
# sudo shutdown -r now 'Rebooting now...'

# Set computer name (as done via System Preferences → Sharing)
#sudo scutil --set ComputerName "0x6D746873"
#sudo scutil --set HostName "0x6D746873"
#sudo scutil --set LocalHostName "0x6D746873"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# Always show the user's Library folder.
chflags nohidden ~/Library/


# # Don’t blink the cursor caret (value is in milliseconds).
# defaults write -g NSTextInsertionPointBlinkPeriod -int 9999999999999999

# # Use a lighter text rendering style.
# # http://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/#comment-435634
# defaults write -g AppleFontSmoothing -int 1

# # Disable auto-save in AppleScript Editor.
# # http://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/#comment-435634
# defaults write com.apple.ScriptEditor2 ApplePersistence -bool false


# ------------------------------------------------------------------------------

setup_notification_center_setings() {

  # Disable Notification Center.
  defaults write /System/Library/LaunchAgents/com.apple.notificationcenterui KeepAlive -bool false

  # # Restart Notification Center to apply the settings.
  # killall NotificationCenter

}

# ------------------------------------------------------------------------------

# These require a system restart to take effect.
setup_general_system_setings() {

  # # Change the default backup periods in Time Machine.
  # sudo defaults write /System/Library/Launch\ Daemons/com.apple.backupd-auto StartInterval -int 1800

  defaults write /Library/Preferences/com.apple.SoftwareUpdate ScheduleFrequency 1

echo "Check for software updates daily, not just once per week."
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Frequency is measured in days.



  # Display additional information on the login screen.
  sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

  # # Change How Long (in seconds) Notification Banners Persist for in OS X
  # defaults write com.apple.notificationcenterui bannerTime [time in seconds]


  # Disable the creation of .DS_store files on network volumes.
  # http://support.apple.com/en-us/ht1629
  # http://www.chrisnovoa.com/os-x-lion-ds_store-disabling/
  # http://www.defaults-write.com/disable-the-creation-of-ds_store-files/
  # http://apple.stackexchange.com/questions/107969/single-purpose-app-to-prevent-ds-store-creation-under-mavericks#comment126770_108064
  # https://www.aorensoftware.com/blog/2011/12/24/death-to-ds_store/
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

  # Set the timezone; see `sudo systemsetup -listtimezones` for other values
  sudo systemsetup -settimezone 'America/New_York' > /dev/null

  # if [ ${OSTYPE} = darwin14* ];then
  #   echo -e "\tEnabling dark mode..."
  #   defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark
  # else
  #   echo "Not Yosemite"
  # fi


}

# ------------------------------------------------------------------------------

# Apply the settings.
source 'app-settings/iterm2.sh'
source 'app-settings/transmission.sh'
source 'osx-settings/activity-monitor.sh'
source 'osx-settings/dock.sh'
source 'osx-settings/finder.sh'
source 'osx-settings/global-domain.sh'
source 'osx-settings/mac-app-store.sh'
source 'osx-settings/safari.sh'
source 'osx-settings/screen-capture.sh'
source 'osx-settings/terminal.sh'
source 'osx-settings/text-edit.sh'



echo '\tDisable tap-to-click for this user and for the login screen.'
defaults -currentHost write com.apple.AppleMultitouchTrackpad Clicking -bool false
defaults -currentHost write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false


# echo '\tEnable ctrl key + scrolling for zoom in/out.'
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.AppleMultitouchTrackpad HIDScrollZoomModifierMask -int 262144
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad HIDScrollZoomModifierMask -int 262144

# # Remove Duplicates from the "Open With" Menu
# # http://macguide.org/#Remove-Duplicates-from-the-Open-With-Menu
# /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder

# # Re-Index Spotlight
# # http://macguide.org/#Re-Index-Spotlight
# sudo mdutil -E -p "/Volumes/Macintosh HD"



# Disable sound effect on boot.
# http://osxdaily.com/2012/11/04/disable-mac-boot-chime/
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Why the sound effect is useful:
# https://discussions.apple.com/message/16577746#16577746#16577746
#
# This no longer works in Yosemite.
sudo nvram SystemAudioVolume=' '
# To undo:
# sudo nvram -d SystemAudioVolume




echo '\tAvoid creating .DS_Store files on network volumes.'
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo '\tDisable the “Are you sure you want to open this application?” dialog.'
defaults write com.apple.LaunchServices LSQuarantine -bool false

# # Show remaining battery time; hide percentage.
# defaults write com.apple.menuextra.battery ShowPercent -string 'NO'
# defaults write com.apple.menuextra.battery ShowTime -string 'YES'

# echo 'Disable disk image verification for quicker mounting.'
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# # Automatically open a new Finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true


# # Disable the “reopen windows when logging back in” option
# # This works, although the checkbox will still appear to be checked.
# defaults write com.apple.loginwindow TALLogoutSavesState -bool false
# defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

# Disable tap to click (Trackpad).
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# Map bottom right Trackpad corner to right-click.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# defaults write com.apple.iphoto MapScrollWheel -bool YES
# killall iPhoto

# # Make ⌘ + F focus the search input in iTunes
# defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"


# # Enable the debug menu in Address Book
# defaults write com.apple.addressbook ABShowDebugMenu -bool true

# # Enable the debug menu in iCal
# defaults write com.apple.iCal IncludeDebugMenu -bool true

# Add a message to the login screen.
# sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Your Message"
# sudo defaults delete /Library/Preferences/com.apple.loginwindow LoginwindowText

# http://www.defaults-write.com/safari-highlight-non-retina-images/




echo '\tEnable AirDrop over Ethernet and on unsupported Macs running Lion.'
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
