# ------------------------------------------------------------------------------
#  Dock, Dashboard, Mission Control, Spaces, and trackpad settings.
# ------------------------------------------------------------------------------

echo '\tEnable Dashboard dev mode (allows keeping widgets on the desktop).'
defaults write com.apple.dashboard devmode -bool true

echo '\tDisable Dashboard.'
defaults write com.apple.dashboard mcx-disabled -bool true

# echo '\tAutomatically hide and show the Dock.'
# defaults write com.apple.dock autohide -bool true

echo '\tRemove the delay for hiding/showing.'
defaults write com.apple.dock autohide-delay -float 0

echo '\tRemove the delay for hiding/showing in fullscreen mode.'
defaults write com.apple.dock autohide-fullscreen-delayed -bool false

echo '\tRemove the animation when hiding/showing.'
defaults write com.apple.dock autohide-time-modifier -float 0

# echo "\tDon’t show Dashboard as a Space."
# defaults write com.apple.dock dashboard-in-overlay -bool true

echo '\tEnable spring loading for all Dock items.'
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo '\tSpeed up Mission Control animations.'
defaults write com.apple.dock expose-animation-duration -float 0.1

echo '\tEnable Mission Control to display full size previews.'
defaults write com.apple.dock expose-cluster-scale -float 1

echo "\tDon't group windows by application in Mission Control (i.e. use the old Expose behavior instead)."
defaults write com.apple.dock expose-group-by-app -bool false

echo '\tDisable the "mirror" effect.'
defaults write com.apple.dock hide-mirror -bool true

# echo '\tEnable iTunes track notifications in the Dock.'
# defaults write com.apple.dock itunes-notifications -bool true

echo '\tSet magnification size.'
defaults write com.apple.dock largesize -float 80
# Default: 128

# # Don’t animate opening applications from the Dock
# defaults write com.apple.dock launchanim -bool false

# # Change minimize/maximize window effect to scale mode.
# #  genie = Genie
# #  scale = Scale
# #  suck = Suck
# defaults write com.apple.dock mineffect -string 'scale'

# # Minimize windows into their application’s icon
# defaults write com.apple.dock minimize-to-application -bool true

# echo "\tDon't automatically rearrange Spaces based on most recent use."
# defaults write com.apple.dock mru-spaces -bool false

echo '\tEnable highlight hover effect for the grid view of a stack.'
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# echo '\tEnable 2D mode.'
# defaults write com.apple.dock no-glass -bool true

# # echo '\tAlways show the iTunes icon in the notifications pop-up beside the currently playing track.'
# defaults write com.apple.dock notification-always-show-image -bool false

echo 'Place the Dock in the bottom middle of the screen.'
defaults write com.apple.dock orientation -string 'bottom'
defaults write com.apple.dock pinning -string 'middle'

echo '\tWipe all persistent items from the Dock.'
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others
# This is only really useful when setting up a new Mac,
# or if you don't use the Dock to launch apps.

echo '\tReset Launchpad.  Pre-Yosemite.'
[ -e ~/Library/Application\ Support/Dock/*.db ] && rm ~/Library/Application\ Support/Dock/*.db

echo '\tReset Launchpad.  Yosemite.'
defaults write com.apple.dock ResetLaunchPad -bool true

echo '\tDisable indicator lights for open applications.'
defaults write com.apple.dock show-process-indicators -bool false

echo '\tMake Dock icons of hidden applications translucent.'
defaults write com.apple.dock showhidden -bool true

echo '\tDisable the Launchpad gesture (pinch with thumb and three fingers).'
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# echo '\tEnable single-app mode.'
# defaults write com.apple.dock single-app -bool true
# # Single-app mode means if you click a Dock icon then every other app is hidden.

echo '\Show only running applications.'
defaults write com.apple.dock static-only -bool true

echo '\tSet the icon size of Dock items.'
defaults write com.apple.dock tilesize -int 60

# echo '\tDisable Spaces animation.'
# defaults write com.apple.dock workspaces-swoosh-animation-off -bool true

# # Clear out the Dock.
# /usr/bin/dockutil --remove all

# /usr/bin/dockutil --add /Applications/Safari.app
# /usr/bin/dockutil --add /Applications/Firefox.app
# /usr/bin/dockutil --add /Applications/Google\ Chrome.app

# Display the location path of current wallpaper in OS X
# defaults write com.apple.dock desktop-picture-show-debug-text -bool true

# # Hot corners
# # Possible values:
# #  0: no-op
# #  2: Mission Control
# #  3: Show application windows
# #  4: Desktop
# #  5: Start screen saver
# #  6: Disable screen saver
# #  7: Dashboard
# # 10: Put display to sleep
# # 11: Launchpad
# # 12: Notification Center

# # Top left screen corner → Mission Control
# defaults write com.apple.dock wvous-tl-corner -int 2
# defaults write com.apple.dock wvous-tl-modifier -int 0
# # Top right screen corner → Desktop
# defaults write com.apple.dock wvous-tr-corner -int 4
# defaults write com.apple.dock wvous-tr-modifier -int 0
# # Bottom left screen corner → Start screen saver
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0

# echo -e "\tSetting top-left corner to Mission Control..."
# defaults write com.apple.dock wvous-tl-corner -int 2    # Mission Control
# defaults write com.apple.dock wvous-tl-modifier -int 0

# echo -e "\tSetting top-right corner to Notification Center..."
# defaults write com.apple.dock wvous-tr-corner -int 12   # Notification Center
# defaults write com.apple.dock wvous-tr-modifier -int 0

# echo -e "\tSetting bottom-left corner to Show Desktop..."
# defaults write com.apple.dock wvous-bl-corner -int 4    # Show Desktop
# defaults write com.apple.dock wvous-bl-modifier -int 0

# # Run the screensaver if we're in the bottom-left hot corner.
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0

# echo -e "\tSetting bottom-right corner to Launchpad..."
# defaults write com.apple.dock wvous-br-corner -int 11   # Launchpad
# defaults write com.apple.dock wvous-br-modifier -int 0

# echo 'Hot corners'
# echo 'Top left screen corner → Mission Control'
# defaults write com.apple.dock wvous-tl-corner -int 2
# defaults write com.apple.dock wvous-tl-modifier -int 0
# defaults write com.apple.dock wvous-br-corner -int 2
# defaults write com.apple.dock wvous-br-modifier -int 0
# echo 'Top right screen corner → Desktop'
# defaults write com.apple.dock wvous-bl-corner -int 4
# defaults write com.apple.dock wvous-bl-modifier -int 0

# # Restart the Dock to apply the settings.
# killall Dock
