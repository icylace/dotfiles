e ''
e '###############################################' $blue
e '#               GENERAL SYSTEM                #' $blue
e '###############################################' $blue
e ''

alias dw='defaults write -g'

e 'Disable menu bar transparency.'
dw AppleEnableMenuBarTransparency -bool false

# # Enable subpixel font rendering on non-Apple LCDs.
# dw AppleFontSmoothing -int 2

# # Set highlight color to green
# dw AppleHighlightColor -string '0.764700 0.976500 0.568600'

e '\tEnable Dark Mode.  Yosemite.'
dw AppleInterfaceStyle -string 'Dark'

e '\tEnable full keyboard access (tab through all GUI buttons and fields, not just text boxes and lists).'
dw AppleKeyboardUIMode -int 3

e '\tDo not minimize the window when the title bar is double-clicked.'
dw AppleMiniaturizeOnDoubleClick -bool false

e '\tDisable press-and-hold for keys in favor of key repeat.'
dw ApplePressAndHoldEnabled -bool false

e '\tShow all file extensions.'
dw AppleShowAllExtensions -bool true

e '\tAlways show scrollbars.'
dw AppleShowScrollBars -string 'Always'
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# e '\tActivate special keyboard behavior with fn + funciton key instead of function key alone.'
# dw com.apple.keyboard.fnState -bool true

e '\tIncreasing mouse tracking to 3.'
dw com.apple.mouse.scaling -float 3

e '\tDisable feedback sound when changing volume.'
dw com.apple.sound.beep.feedback -bool false

e '\tRemove the spring loading delay for directories.'
dw com.apple.springing.delay -float 0

e '\tEnable spring loading for directories.'
dw com.apple.springing.enabled -bool true

e '\tDisable "natural" (touchscreen-style) scrolling.'
dw com.apple.swipescrolldirection -bool false

e '\tSet mouse acceleration.'
dw com.apple.mouse.scaling -float 0.875

e '\tSet scroll wheel acceleration.'
dw com.apple.scrollwheel.scaling -float 0.125

e '\tDecrease the delay until keys are repeated.'
dw InitialKeyRepeat -int 12

e '\tSet a blazingly fast keyboard repeat rate.'
dw KeyRepeat -int 0

e "\tDisable smart dashes as they're annoying when typing code."
dw NSAutomaticDashSubstitutionEnabled -bool false

e "\tDisable smart quotes as they're annoying when typing code."
dw NSAutomaticQuoteSubstitutionEnabled -bool false

e '\tDisable window opening and closing animations.'
dw NSAutomaticWindowAnimationsEnabled -bool false

e '\tDisable auto-correct.  Go to http://www.damnyouautocorrect.com/ to see why.'
dw NSAutomaticSpellingCorrectionEnabled -bool false

# e '\tMaking the scroll dragging speed faster.'
# dw NSAutoscrollResponseMultiplier -float 3

# e '\tDisable automatic termination of inactive apps.'
# dw NSDisableAutomaticTermination -bool true

e '\tSave to disk (not to iCloud) by default.'
dw NSDocumentSaveNewDocumentsToCloud -bool false

# e '\tIncrease tooltip delay.'
# dw NSInitialToolTipDelay -int 30000

e '\tExpand the save panel by default.'
dw NSNavPanelExpandedStateForSaveMode -bool true
dw NSNavPanelExpandedStateForSaveMode2 -bool true

# e  '\tDisable "Resume" system-wide.'
# dw NSQuitAlwaysKeepsWindows -bool false

# e '\tDisable smooth scrolling.'
# dw NSScrollAnimationEnabled -bool false
# # Uncomment if you’re on an older Mac that messes up the animation.

# # Set sidebar icon size to medium.
# dw NSTableViewDefaultSizeMode -int 2

e '\tDisplay ASCII control characters using caret notation in standard text views.'
dw NSTextShowsControlCharacters -bool true
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`

e '\tSet sidebar icon size to medium.'
dw NSTableViewDefaultSizeMode -int 2

e '\tFor all applications change tabs with cmd-opt-arrow.'
dw NSUserKeyEquivalents -dict-add 'Show Next Tab'       '@~\U2192'
dw NSUserKeyEquivalents -dict-add 'Show Previous Tab'   '@~\U2190'
dw NSUserKeyEquivalents -dict-add 'Select Next Tab'     '@~\U2192'
dw NSUserKeyEquivalents -dict-add 'Select Previous Tab' '@~\U2190'
dw NSUserKeyEquivalents -dict-add 'Next Tab'            '@~\U2192'
dw NSUserKeyEquivalents -dict-add 'Previous Tab'        '@~\U2190'
#
# Keyboard shortcuts modifier key legend:
#  @ = command
#  ^ = control
#  ~ = option
#  $ = shift
#
# NOTE:
# These shortcuts will not show in System Preferences
# and setting new shortcuts there will overwrite these.
#

e '\tIncrease window resize speed for Cocoa applications.'
dw NSWindowResizeTime -floar 0.01

e '\tExpand the print panel by default.'
dw PMPrintingExpandedStateForPrint -bool true
dw PMPrintingExpandedStateForPrint2 -bool true

e '\tDisable the animations for opening Quick Look windows.'
dw QLPanelAnimationDuration -float 0

# e '\tIncreasing trackpad tracking to 3.'
# dw com.apple.trackpad.scaling -int 3

e '\tAdd a context menu item for showing the Web Inspector in web views.'
dw WebKitDeveloperExtras -bool true
