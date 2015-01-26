e ''
e '-----------------------------------------------' $blue
e '-               General System                -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write -g'

et 'Disable menu bar transparency.'
dw AppleEnableMenuBarTransparency -bool false

# et 'Enable subpixel font rendering on non-Apple LCDs.'
# dw AppleFontSmoothing -int 2

# et 'Set highlight color to green.'
# dw AppleHighlightColor -string '0.764700 0.976500 0.568600'

et 'Enable Dark Mode in Yosemite.'
dw AppleInterfaceStyle -string 'Dark'

et 'Enable full keyboard access (tab through all GUI buttons and fields, not just text boxes and lists).'
dw AppleKeyboardUIMode -int 3

et 'Do not minimize the window when the title bar is double-clicked.'
dw AppleMiniaturizeOnDoubleClick -bool false

et 'Disable press-and-hold for keys in favor of key repeat.'
dw ApplePressAndHoldEnabled -bool false

et 'Show all file extensions.'
dw AppleShowAllExtensions -bool true

et 'Always show scrollbars.'
dw AppleShowScrollBars -string 'Always'
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# et 'Activate special keyboard behavior with fn + funciton key instead of function key alone.'
# dw com.apple.keyboard.fnState -bool true

et 'Increasing mouse tracking to 3.'
dw com.apple.mouse.scaling -float 3

et 'Disable feedback sound when changing volume.'
dw com.apple.sound.beep.feedback -bool false

et 'Remove the spring loading delay for directories.'
dw com.apple.springing.delay -float 0

et 'Enable spring loading for directories.'
dw com.apple.springing.enabled -bool true

et 'Disable "natural" (touchscreen-style) scrolling.'
dw com.apple.swipescrolldirection -bool false

et 'Set mouse acceleration.'
dw com.apple.mouse.scaling -float 0.875

et 'Set scroll wheel acceleration.'
dw com.apple.scrollwheel.scaling -float 0.125

et 'Decrease the delay until keys are repeated.'
dw InitialKeyRepeat -int 12

et 'Set a blazingly fast keyboard repeat rate.'
dw KeyRepeat -int 0

et "Disable smart dashes as they're annoying when typing code."
dw NSAutomaticDashSubstitutionEnabled -bool false

et "Disable smart quotes as they're annoying when typing code."
dw NSAutomaticQuoteSubstitutionEnabled -bool false

et 'Disable window opening and closing animations.'
dw NSAutomaticWindowAnimationsEnabled -bool false

et 'Disable auto-correct.  Go to http://www.damnyouautocorrect.com/ to see why.'
dw NSAutomaticSpellingCorrectionEnabled -bool false

# et 'Making the scroll dragging speed faster.'
# dw NSAutoscrollResponseMultiplier -float 3

# et 'Disable automatic termination of inactive apps.'
# dw NSDisableAutomaticTermination -bool true

et 'Save to disk (not to iCloud) by default.'
dw NSDocumentSaveNewDocumentsToCloud -bool false

# et 'Increase tooltip delay.'
# dw NSInitialToolTipDelay -int 30000

et 'Expand the save panel by default.'
dw NSNavPanelExpandedStateForSaveMode -bool true
dw NSNavPanelExpandedStateForSaveMode2 -bool true

# et 'Disable "Resume" system-wide.'
# dw NSQuitAlwaysKeepsWindows -bool false

# et 'Disable smooth scrolling.'
# dw NSScrollAnimationEnabled -bool false
# # Uncomment if you’re on an older Mac that messes up the animation.

# et 'Set sidebar icon size to medium.'
# dw NSTableViewDefaultSizeMode -int 2

et 'Display ASCII control characters using caret notation in standard text views.'
dw NSTextShowsControlCharacters -bool true
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`

et 'Set sidebar icon size to medium.'
dw NSTableViewDefaultSizeMode -int 2

et 'For all applications change tabs with cmd-opt-arrow.'
dw NSUserKeyEquivalents -dict-add 'Show Next Tab'       '@~\U2192'
dw NSUserKeyEquivalents -dict-add 'Show Previous Tab'   '@~\U2190'
dw NSUserKeyEquivalents -dict-add 'Select Next Tab'     '@~\U2192'
dw NSUserKeyEquivalents -dict-add 'Select Previous Tab' '@~\U2190'
dw NSUserKeyEquivalents -dict-add 'Next Tab'            '@~\U2192'
dw NSUserKeyEquivalents -dict-add 'Previous Tab'        '@~\U2190'
#
# Keyboard shortcuts modifier key legend:
#   @ = command
#   ^ = control
#   ~ = option
#   $ = shift
#
# NOTE:
# These shortcuts will not show in System Preferences
# and setting new shortcuts there will overwrite these.
#

et 'Increase window resize speed for Cocoa applications.'
dw NSWindowResizeTime -floar 0.01

et 'Expand the print panel by default.'
dw PMPrintingExpandedStateForPrint -bool true
dw PMPrintingExpandedStateForPrint2 -bool true

et 'Disable the animations for opening Quick Look windows.'
dw QLPanelAnimationDuration -float 0

# et 'Increasing trackpad tracking to 3.'
# dw com.apple.trackpad.scaling -int 3

et 'Add a context menu item for showing the Web Inspector in web views.'
dw WebKitDeveloperExtras -bool true
