e ''
e '-----------------------------------------------' $blue
e '-                   iTerm2                    -' $blue
e '-             Terminal emulator.              -' $blue
e '-             http://iterm2.com/              -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.googlecode.iterm2'

e "\tDon't display the annoying prompt when quitting."
dw PromptOnQuit -bool false
