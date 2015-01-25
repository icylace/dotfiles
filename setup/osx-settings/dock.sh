e ''
e '-----------------------------------------------' $blue
e '-      Dock, Dashboard, Mission Control       -' $blue
e '-            Spaces, and Trackpad             -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.apple.dashboard'

et 'Enable Dashboard dev mode (allows keeping widgets on the desktop).'
dw devmode -bool true

# et 'Show the dashboard as an overlay.'
# dw enabled-state -int 3

et 'Disable Dashboard.'
dw mcx-disabled -bool true

# ------------------------------------------------------------------------------

alias dw='defaults write com.apple.dock'

et 'Automatically hide and show the Dock.'
dw autohide -bool true

et 'Remove the delay for hiding/showing.'
dw autohide-delay -float 0

et 'Remove the delay for hiding/showing in fullscreen mode.'
dw autohide-fullscreen-delayed -bool false

et 'Remove the animation when hiding/showing.'
dw autohide-time-modifier -float 0

# et "Don’t show Dashboard as a Space."
# dw dashboard-in-overlay -bool true

et 'Enable spring loading for all Dock items.'
dw enable-spring-load-actions-on-all-items -bool true

et 'Speed up Mission Control animations.'
dw expose-animation-duration -float 0.1

et 'Enable Mission Control to display full size previews.'
dw expose-cluster-scale -float 1

et "Don't group windows by application in Mission Control (i.e. use the old Expose behavior instead)."
dw expose-group-by-app -bool false

et 'Disable the "mirror" effect.'
dw hide-mirror -bool true

# et 'Enable iTunes track notifications in the Dock.'
# dw itunes-notifications -bool true

et 'Set magnification size to 80.'
dw largesize -float 80
# Default: 128

# # Don’t animate opening applications from the Dock
# dw launchanim -bool false

et 'Change minimize/maximize window effect to suck mode.'
dw mineffect -string 'suck'
# Possible values:
#   genie = Genie
#   scale = Scale
#   suck  = Suck

et "Do not minimize windows into their application’s icon."
dw minimize-to-application -bool false

et 'Enable highlight hover effect for the grid view of a stack.'
dw mouse-over-hilite-stack -bool true

et "Don't automatically rearrange Spaces based on most recent use."
dw mru-spaces -bool false

# et 'Enable 2D mode.'
# dw no-glass -bool true

# # et 'Always show the iTunes icon in the notifications pop-up beside the currently playing track.'
# dw notification-always-show-image -bool false

et 'Place the Dock in the bottom middle of the screen.'
dw orientation -string 'bottom'
dw pinning -string 'middle'

et 'Wipe all persistent items from the Dock.'
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others
# This is only really useful when setting up a new Mac,
# or if you don't use the Dock to launch apps.

et 'Reset Launchpad.  Pre-Yosemite.'
[ -e ${HOME}/Library/Application\ Support/Dock/*.db ] && rm ${HOME}/Library/Application\ Support/Dock/*.db

et 'Reset Launchpad.  Yosemite.'
dw ResetLaunchPad -bool true

et 'Disable indicator lights for open applications.'
dw show-process-indicators -bool false

et 'Make Dock icons of hidden applications translucent.'
dw showhidden -bool true

et 'Disable the Launchpad gesture (pinch with thumb and three fingers).'
dw showLaunchpadGestureEnabled -int 0

# et 'Enable single-app mode.'
# dw single-app -bool true
# # Single-app mode means if you click a Dock icon then every other app is hidden.

et 'Show only running applications.'
dw static-only -bool true

et 'Set the icon size of Dock items.'
dw tilesize -int 60

# et 'Stop from switching spaces due to an app coming to the foreground.'
# dw workspaces-auto-swoosh -bool false
# # http://apple.stackexchange.com/a/4821

et 'Stop (slow down) from switching spaces if your mouse presses against the edge of the desktop.'
dw workspaces-edge-delay -bool true
# http://apple.stackexchange.com/a/4821

et 'Disable Spaces animation.'
dw workspaces-swoosh-animation-off -bool true

# # Clear out the Dock.
# /usr/bin/dockutil --remove all

# /usr/bin/dockutil --add /Applications/Safari.app
# /usr/bin/dockutil --add /Applications/Firefox.app
# /usr/bin/dockutil --add /Applications/Google\ Chrome.app

# et 'Display the location path of current wallpaper in OS X.'
# dw desktop-picture-show-debug-text -bool true

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

# et 'Set the top-left screen corner to Mission Control.'
# dw wvous-tl-corner -int 2
# dw wvous-tl-modifier -int 0

# et 'Set the top-right corner to Notification Center.'
# dw wvous-tr-corner -int 12
# dw wvous-tr-modifier -int 0

# et 'Set the bottom-left corner to Show Desktop.'
# dw wvous-bl-corner -int 4    # Show Desktop
# dw wvous-bl-modifier -int 0

# et "Setting bottom-right corner to Launchpad..."
# dw wvous-br-corner -int 11   # Launchpad
# dw wvous-br-modifier -int 0

# # Restart the Dock to apply the settings.
# killall Dock
