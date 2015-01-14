e ''
e '###############################################' $blue
e '#               GENERAL SYSTEM                #' $blue
e '###############################################' $blue
e ''

e 'Disable menu bar transparency.'
defaults write -g AppleEnableMenuBarTransparency -bool false

# # Enable subpixel font rendering on non-Apple LCDs.
# defaults write -g AppleFontSmoothing -int 2

# # Set highlight color to green
# defaults write -g AppleHighlightColor -string '0.764700 0.976500 0.568600'

e '\tEnable Dark Mode.  Yosemite.'
defaults write -g AppleInterfaceStyle -string 'Dark'

e '\tEnable full keyboard access (tab through all GUI buttons and fields, not just text boxes and lists).'
defaults write -g AppleKeyboardUIMode -int 3

e '\tDo not minimize the window when the title bar is double-clicked.'
defaults write -g AppleMiniaturizeOnDoubleClick -bool false

e '\tDisable press-and-hold for keys in favor of key repeat.'
defaults write -g ApplePressAndHoldEnabled -bool false

e '\tShow all file extensions.'
defaults write -g AppleShowAllExtensions -bool true

e '\tAlways show scrollbars.'
defaults write -g AppleShowScrollBars -string 'Always'
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# e '\tActivate special keyboard behavior with fn + funciton key instead of function key alone.'
# defaults write -g com.apple.keyboard.fnState -bool true

e '\tIncreasing mouse tracking to 3.'
defaults write -g com.apple.mouse.scaling -float 3

e '\tDisable feedback sound when changing volume.'
defaults write -g com.apple.sound.beep.feedback -bool false

e '\tRemove the spring loading delay for directories.'
defaults write -g com.apple.springing.delay -float 0

e '\tEnable spring loading for directories.'
defaults write -g com.apple.springing.enabled -bool true

e '\tDisable "natural" (touchscreen-style) scrolling.'
defaults write -g com.apple.swipescrolldirection -bool false

e '\tSet mouse acceleration.'
defaults write -g com.apple.mouse.scaling -float 0.875

e '\tSet scroll wheel acceleration.'
defaults write -g com.apple.scrollwheel.scaling -float 0.125

e '\tDecrease the delay until keys are repeated.'
defaults write -g InitialKeyRepeat -int 12

e '\tSet a blazingly fast keyboard repeat rate.'
defaults write -g KeyRepeat -int 0

e "\tDisable smart dashes as they're annoying when typing code."
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

e "\tDisable smart quotes as they're annoying when typing code."
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false

e '\tDisable window opening and closing animations.'
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

e '\tDisable auto-correct.  Go to http://www.damnyouautocorrect.com/ to see why.'
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# e '\tMaking the scroll dragging speed faster.'
# defaults write -g NSAutoscrollResponseMultiplier -float 3

# e '\tDisable automatic termination of inactive apps.'
# defaults write -g NSDisableAutomaticTermination -bool true

e '\tSave to disk (not to iCloud) by default.'
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# e '\tIncrease tooltip delay.'
# defaults write -g NSInitialToolTipDelay -int 30000

e '\tExpand the save panel by default.'
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# e  '\tDisable "Resume" system-wide.'
# defaults write -g NSQuitAlwaysKeepsWindows -bool false

# e '\tDisable smooth scrolling.'
# defaults write -g NSScrollAnimationEnabled -bool false
# # Uncomment if you’re on an older Mac that messes up the animation.

# # Set sidebar icon size to medium.
# defaults write -g NSTableViewDefaultSizeMode -int 2

e '\tDisplay ASCII control characters using caret notation in standard text views.'
defaults write -g NSTextShowsControlCharacters -bool true
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`

e '\tSet sidebar icon size to medium.'
defaults write -g NSTableViewDefaultSizeMode -int 2

e '\tFor all applications change tabs with cmd-opt-arrow.'
defaults write -g NSUserKeyEquivalents -dict-add 'Show Next Tab'       '@~\U2192'
defaults write -g NSUserKeyEquivalents -dict-add 'Show Previous Tab'   '@~\U2190'
defaults write -g NSUserKeyEquivalents -dict-add 'Select Next Tab'     '@~\U2192'
defaults write -g NSUserKeyEquivalents -dict-add 'Select Previous Tab' '@~\U2190'
defaults write -g NSUserKeyEquivalents -dict-add 'Next Tab'            '@~\U2192'
defaults write -g NSUserKeyEquivalents -dict-add 'Previous Tab'        '@~\U2190'
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
defaults write -g NSWindowResizeTime -floar 0.01

e '\tExpand the print panel by default.'
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

e '\tDisable the animations for opening Quick Look windows.'
defaults write -g QLPanelAnimationDuration -float 0

# e '\tIncreasing trackpad tracking to 3.'
# defaults write -g com.apple.trackpad.scaling -int 3

e '\tAdd a context menu item for showing the Web Inspector in web views.'
defaults write -g WebKitDeveloperExtras -bool true
