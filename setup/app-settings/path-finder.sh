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

# "colors/gradients" = <62706c69 73743030 d4010203 0405061a 1b582476 65727369 6f6e5824 6f626a65 63747359 24617263 68697665 72542474 6f701200 0186a0a5 07081112 1355246e 756c6cd3 090a0b0c 0e10574e 532e6b65 79735a4e 532e6f62 6a656374 73562463 6c617373 a10d8002 a10f8003 80041013 09d21415 16175a24 636c6173 736e616d 65582463 6c617373 65735f10 134e534d 75746162 6c654469 6374696f 6e617279 a3161819 5c4e5344 69637469 6f6e6172 79584e53 4f626a65 63745f10 0f4e534b 65796564 41726368 69766572 d11c1d54 726f6f74 80010811 1a232d32 373d434a 525d6466 686a6c6e 70717681 8aa0a4b1 bacccfd4 00000000 00000101 00000000 0000001e 00000000 00000000 00000000 000000d6>

et 'Use Base-2 math for file sizes.'
dw useBase2MathForSizes -bool true

et 'Disable the warning on quit.'
dw disableWarnOnQuit -bool true
