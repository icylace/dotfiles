# ------------------------------------------------------------------------------
#  Set OS X defaults that I like.
# ------------------------------------------------------------------------------
#
# These settings are meant to be used on at least 10.9 (Mavericks).
#
# Use `defaults delete {domain} {key}` to undo settings.  For example, using:
# `defaults write com.apple.dock expose-animation-duration -float 0.1` can be
# using `defaults delete com.apple.dock expose-animation-duration`.
#
#  Heavy influence and much copying from:
#  - https://mths.be/osx
#  - http://jasahackintosh.wordpress.com/2014/09/04/tweak-os-x-from-command-terminal/
#  - http://lifehacker.com/how-to-make-your-own-bulk-app-installer-for-os-x-1586252163
#  - http://macguide.org/
#  - http://osxdaily.com/2010/02/15/disable-the-crash-reporter-dialog-in-mac-os-x/
#  - http://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/#comment-435634
#  - http://secrets.blacktree.com/edit?id=238762
#  - http://wp.secretnest.info/archives/3129
#  - http://www.amsys.co.uk/2013/blog/how-to-enable-mission-control-to-display-full-size-previews/#.VKextGTF_yU
#  - http://www.maclife.com/article/howtos/how-to-customize-dock
#  - http://www.roaminggenius.com/blog/os-x-tip-resetting-launchpad-layout/
#  - http://www.tekrevue.com/tip/the-complete-guide-to-customizing-mac-os-xs-dock-with-terminal/
#  - https://gist.github.com/nicerobot/1193218
#  - https://gist.github.com/zenspider/8ee55e7c00b9201dd84f
#  - https://github.com/divio/osx-bootstrap/blob/master/core/defaults.sh
#  - https://github.com/eolamey/dotfiles/blob/master/misc/osx-defaults
#  - https://github.com/mathiasbynens/dotfiles/pull/306/files
#  - https://github.com/mikker/dotfiles/blob/master/osx
#  - https://github.com/RStankov/config_files/blob/master/dot/osx
#  - https://github.com/trusche/dotfiles/blob/master/osx
#  - https://github.com/virtualswede/osx-bootstrap
#  - https://github.com/ymendel/dotfiles/tree/master/osx
#

# We're focusing on OS X so abort if we're not in OS X.
[[ "$OSTYPE" =~ ^darwin ]] || return 1


# # # Change the default backup periods in Time Machine.
# # sudo defaults write /System/Library/Launch\ Daemons/com.apple.backupd-auto StartInterval -int 1800

# echo "Check for software updates daily, not just once per week."
# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# # Frequency is measured in days.

# echo "Disabling local Time Machine backups"
# hash tmutil &> /dev/null && sudo tmutil disablelocal

# # Display additional information on the login screen.
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# # # Change How Long (in seconds) Notification Banners Persist for in OS X
# # defaults write com.apple.notificationcenterui bannerTime [time in seconds]


# # Set the timezone; see `sudo systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone 'America/New_York' > /dev/null

# # if [ ${OSTYPE} = darwin14* ];then
# #   echo -e "\tEnabling dark mode..."
# #   defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark
# # else
# #   echo "Not Yosemite"
# # fi


# ------------------------------------------------------------------------------



# Hidden wallpapers.
# /Library/Screen Savers/Default Collections

# # Set the computer name.
# sudo systemsetup -setcomputername {{computername}}


# Set computer name (as done via System Preferences → Sharing)
#sudo scutil --set ComputerName "0x6D746873"
#sudo scutil --set HostName "0x6D746873"
#sudo scutil --set LocalHostName "0x6D746873"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# Always show the user's Library folder.
chflags nohidden ~/Library/



# # Remove Duplicates from the "Open With" Menu
# # http://macguide.org/#Remove-Duplicates-from-the-Open-With-Menu
# /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder

# # Re-Index Spotlight
# # http://macguide.org/#Re-Index-Spotlight
# sudo mdutil -E -p "/Volumes/Macintosh HD"

# # Add iOS Simulator to Launchpad
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications/iOS Simulator.app"

# echo '\tDisabling local Time Machine backups.'
# hash tmutil &> /dev/null && sudo tmutil disablelocal

# # Reset Launchpad, but keep the desktop wallpaper intact
# find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete


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




# echo '\tDisable Notification Center and remove the menu bar icon.'
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

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


# # ------------------------------------------------------------------------------
# #  OS X Lion setings.
# # ------------------------------------------------------------------------------

# echo '\tEnable AirDrop over Ethernet and on unsupported Macs running Lion.'
# defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# if [$(which defaults)]; then

  for f in osx-settings/*.sh; do
    source $f
  done

  for f in app-settings/*.sh; do
    source $f
  done

  echo 'OS X defaults written. Note that some of these changes require a logout/restart to take effect.'

# fi
