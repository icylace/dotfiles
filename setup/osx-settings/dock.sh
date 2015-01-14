e ''
e '###############################################' $blue
e '#      DOCK, DASHBOARD, MISSION CONTROL       #' $blue
e '#            SPACES, AND TRACKPAD             #' $blue
e '###############################################' $blue
e ''

e '\tEnable Dashboard dev mode (allows keeping widgets on the desktop).'
defaults write com.apple.dashboard devmode -bool true

# e '\tShow the dashboard as an overlay.'
# defaults write com.apple.dashboard enabled-state -int 3

e '\tDisable Dashboard.'
defaults write com.apple.dashboard mcx-disabled -bool true

# e '\tAutomatically hide and show the Dock.'
# defaults write com.apple.dock autohide -bool true

e '\tRemove the delay for hiding/showing.'
defaults write com.apple.dock autohide-delay -float 0

e '\tRemove the delay for hiding/showing in fullscreen mode.'
defaults write com.apple.dock autohide-fullscreen-delayed -bool false

e '\tRemove the animation when hiding/showing.'
defaults write com.apple.dock autohide-time-modifier -float 0

# e "\tDon’t show Dashboard as a Space."
# defaults write com.apple.dock dashboard-in-overlay -bool true

e '\tEnable spring loading for all Dock items.'
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

e '\tSpeed up Mission Control animations.'
defaults write com.apple.dock expose-animation-duration -float 0.1

e '\tEnable Mission Control to display full size previews.'
defaults write com.apple.dock expose-cluster-scale -float 1

e "\tDon't group windows by application in Mission Control (i.e. use the old Expose behavior instead)."
defaults write com.apple.dock expose-group-by-app -bool false

e '\tDisable the "mirror" effect.'
defaults write com.apple.dock hide-mirror -bool true

# e '\tEnable iTunes track notifications in the Dock.'
# defaults write com.apple.dock itunes-notifications -bool true

e '\tSet magnification size to 80.'
defaults write com.apple.dock largesize -float 80
# Default: 128

# # Don’t animate opening applications from the Dock
# defaults write com.apple.dock launchanim -bool false

e '\tChange minimize/maximize window effect to suck mode.'
defaults write com.apple.dock mineffect -string 'suck'
# Possible values:
#   genie = Genie
#   scale = Scale
#   suck = Suck

e "\tDo not minimize windows into their application’s icon."
defaults write com.apple.dock minimize-to-application -bool false

e '\tEnable highlight hover effect for the grid view of a stack.'
defaults write com.apple.dock mouse-over-hilite-stack -bool true

e "\tDon't automatically rearrange Spaces based on most recent use."
defaults write com.apple.dock mru-spaces -bool false

# e '\tEnable 2D mode.'
# defaults write com.apple.dock no-glass -bool true

# # e '\tAlways show the iTunes icon in the notifications pop-up beside the currently playing track.'
# defaults write com.apple.dock notification-always-show-image -bool false

e 'Place the Dock in the bottom middle of the screen.'
defaults write com.apple.dock orientation -string 'bottom'
defaults write com.apple.dock pinning -string 'middle'

e '\tWipe all persistent items from the Dock.'
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others
# This is only really useful when setting up a new Mac,
# or if you don't use the Dock to launch apps.

e '\tReset Launchpad.  Pre-Yosemite.'
[ -e ${HOME}/Library/Application\ Support/Dock/*.db ] && rm ${HOME}/Library/Application\ Support/Dock/*.db

e '\tReset Launchpad.  Yosemite.'
defaults write com.apple.dock ResetLaunchPad -bool true

e '\tDisable indicator lights for open applications.'
defaults write com.apple.dock show-process-indicators -bool false

e '\tMake Dock icons of hidden applications translucent.'
defaults write com.apple.dock showhidden -bool true

e '\tDisable the Launchpad gesture (pinch with thumb and three fingers).'
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# e '\tEnable single-app mode.'
# defaults write com.apple.dock single-app -bool true
# # Single-app mode means if you click a Dock icon then every other app is hidden.

e '\Show only running applications.'
defaults write com.apple.dock static-only -bool true

e '\tSet the icon size of Dock items.'
defaults write com.apple.dock tilesize -int 60

# e '\tStop from switching spaces due to an app coming to the foreground.'
# defaults write com.apple.dock workspaces-auto-swoosh -bool false
# # http://apple.stackexchange.com/a/4821

e '\tStop (slow down) from switching spaces if your mouse presses against the edge of the desktop.'
defaults write com.apple.dock workspaces-edge-delay -bool true
# http://apple.stackexchange.com/a/4821

e '\tDisable Spaces animation.'
defaults write com.apple.dock workspaces-swoosh-animation-off -bool true

# # Clear out the Dock.
# /usr/bin/dockutil --remove all

# /usr/bin/dockutil --add /Applications/Safari.app
# /usr/bin/dockutil --add /Applications/Firefox.app
# /usr/bin/dockutil --add /Applications/Google\ Chrome.app

# e '\tDisplay the location path of current wallpaper in OS X.'
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

# e '\tSet the top-left screen corner to Mission Control.'
# defaults write com.apple.dock wvous-tl-corner -int 2
# defaults write com.apple.dock wvous-tl-modifier -int 0

# e '\tSet the top-right corner to Notification Center.'
# defaults write com.apple.dock wvous-tr-corner -int 12
# defaults write com.apple.dock wvous-tr-modifier -int 0

# e '\tSet the bottom-left corner to Show Desktop.'
# defaults write com.apple.dock wvous-bl-corner -int 4    # Show Desktop
# defaults write com.apple.dock wvous-bl-modifier -int 0

# e "\tSetting bottom-right corner to Launchpad..."
# defaults write com.apple.dock wvous-br-corner -int 11   # Launchpad
# defaults write com.apple.dock wvous-br-modifier -int 0

# # Restart the Dock to apply the settings.
# killall Dock
