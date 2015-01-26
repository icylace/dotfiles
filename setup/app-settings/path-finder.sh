e ''
e '-----------------------------------------------' $blue
e '-                 Path Finder                 -' $blue
e '-                File manager.                -' $blue
e '-      http://cocoatech.com/pathfinder/       -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.cocoatech.PathFinder'

et 'Set the text editor to use.'
dw textEditorApplicationPath -string '/opt/homebrew-cask/Caskroom/sublime-text-dev/Build 3066/Sublime Text.app'

et 'Set the terminal emulator to use.'
dw kTerminalApplicationPath -string '/opt/homebrew-cask/Caskroom/iterm2-beta/2.0.0.20141103/iTerm.app'

et 'Make Path Finder the default file viewer.'
dw pathFinderIsDefaultFileViewer -bool true

et 'Set the default folder.'
dw kNTDefaultTabPath -string "${HOME}"

et 'Make sure files are copied correctly.'
dw NTVerifyCopiedFiles -bool true

et 'Use Base-2 math for file sizes.'
dw useBase2MathForSizes -bool true

et 'Disable the warning on quit.'
dw disableWarnOnQuit -bool true
