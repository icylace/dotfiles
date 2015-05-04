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
# Heavy influence and much copying from:
# - https://mths.be/osx
# - http://jasahackintosh.wordpress.com/2014/09/04/tweak-os-x-from-command-terminal/
# - http://lifehacker.com/how-to-make-your-own-bulk-app-installer-for-os-x-1586252163
# - http://macguide.org/
# - http://osxdaily.com/2010/02/15/disable-the-crash-reporter-dialog-in-mac-os-x/
# - http://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/#comment-435634
# - http://secrets.blacktree.com/edit?id=238762
# - http://wp.secretnest.info/archives/3129
# - http://www.amsys.co.uk/2013/blog/how-to-enable-mission-control-to-display-full-size-previews/#.VKextGTF_yU
# - http://www.maclife.com/article/howtos/how-to-customize-dock
# - http://www.roaminggenius.com/blog/os-x-tip-resetting-launchpad-layout/
# - http://www.tekrevue.com/tip/the-complete-guide-to-customizing-mac-os-xs-dock-with-terminal/
# - https://gist.github.com/nicerobot/1193218
# - https://gist.github.com/zenspider/8ee55e7c00b9201dd84f
# - https://github.com/divio/osx-bootstrap/blob/master/core/defaults.sh
# - https://github.com/eolamey/dotfiles/blob/master/misc/osx-defaults
# - https://github.com/mathiasbynens/dotfiles/pull/306/files
# - https://github.com/mikker/dotfiles/blob/master/osx
# - https://github.com/RStankov/config_files/blob/master/dot/osx
# - https://github.com/trusche/dotfiles/blob/master/osx
# - https://github.com/virtualswede/osx-bootstrap
# - https://github.com/ymendel/dotfiles/tree/master/osx
#

# We're focusing on OS X so abort if we're not in OS X.
[[ "$OSTYPE" =~ ^darwin ]] || return 1


# # # Change the default backup periods in Time Machine.
# # sudo defaults write /System/Library/Launch\ Daemons/com.apple.backupd-auto StartInterval -int 1800

# et 'Check for software updates daily, not just once per week.'
# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# # Frequency is measured in days.

# et 'Disabling local Time Machine backups'
# hash tmutil &> /dev/null && sudo tmutil disablelocal

# et 'Display additional information on the login screen.'
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# # # Change How Long (in seconds) Notification Banners Persist for in OS X
# # defaults write com.apple.notificationcenterui bannerTime [time in seconds]


# # Set the timezone; see `sudo systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone 'America/New_York' > /dev/null

# # if [ ${OSTYPE} = darwin14* ];then
# #   et 'Enabling dark mode.'
# #   defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark
# # else
# #   et 'Not Yosemite.'
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



# et 'Remove duplicates from the "Open With" menu.'
# /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder
# # http://macguide.org/#Remove-Duplicates-from-the-Open-With-Menu

# et 'Re-index Spotlight.'
# sudo mdutil -E -p "/Volumes/Macintosh HD"
# # http://macguide.org/#Re-Index-Spotlight

# et 'Add iOS Simulator to Launchpad.'
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications/iOS Simulator.app"

# et 'Disabling local Time Machine backups.'
# hash tmutil &> /dev/null && sudo tmutil disablelocal

# et 'Reset Launchpad, but keep the desktop wallpaper intact.'
# find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete


# et 'Disable sound effect on boot.'
# # http://osxdaily.com/2012/11/04/disable-mac-boot-chime/
# # https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# #
# # Why the sound effect is useful:
# # https://discussions.apple.com/message/16577746#16577746#16577746
# #
# # This no longer works in Yosemite.
# sudo nvram SystemAudioVolume=' '
# # To undo:
# # sudo nvram -d SystemAudioVolume


# et 'Disable Notification Center and remove the menu bar icon.'
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

# defaults write com.apple.iphoto MapScrollWheel -bool YES
# killall iPhoto

# et 'Make ⌘ + F focus the search input in iTunes.'
# defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"


# et 'Enable the debug menu in Address Book.'
# defaults write com.apple.addressbook ABShowDebugMenu -bool true

# et 'Enable the debug menu in iCal.'
# defaults write com.apple.iCal IncludeDebugMenu -bool true

# et 'Add a message to the login screen.'
# sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Your Message"
# sudo defaults delete /Library/Preferences/com.apple.loginwindow LoginwindowText

# http://www.defaults-write.com/safari-highlight-non-retina-images/


# # Alcatraz
# # Package manager for Xcode.
# # http://alcatraz.io/
# curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

# # CocoaPods
# # Dependency manager for Cocoa projects.
# # http://cocoapods.org/
# sudo gem install cocoapods




# nvm alias default stable


# # blacklisted-gulp
# # Searches for blacklisted Gulp plugins in your project.
# # https://github.com/ernestoalejo/blacklisted-gulp
# # https://www.npmjs.com/package/blacklisted-gulp
# npm install --global blacklisted-gulp

# # Bower
# # Package manager for the web projects.
# # http://bower.io/
# npm install --global bower

# # deps-ok
# # Fast checking of top level dependencies based on version numbers.
# # https://www.npmjs.com/package/deps-ok
# npm install --global deps-ok

# # Gulp
# # The streaming build system.
# # http://gulpjs.com/
# npm install --global gulp

# # npm-check-updates
# # Finds newer versions of dependencies than what your package.json allows.
# # https://www.npmjs.com/package/npm-check-updates
# npm install --global npm-check-updates

# # Slush
# # The streaming scaffolding system.
# # http://slushjs.github.io/#/
# npm install --global slush




# # ------------------------------------------------------------------------------
# #  OS X Lion setings.
# # ------------------------------------------------------------------------------

# et 'Enable AirDrop over Ethernet and on unsupported Macs running Lion.'
# defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# if [$(which defaults)]; then

  for f in osx-settings/*.sh; do
    source $f
  done

  for f in app-settings/*.sh; do
    source $f
  done

  e 'OS X defaults written. Note that some of these changes require a logout/restart to take effect.'

# fi
