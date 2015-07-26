e ''
e '-----------------------------------------------' $blue
e '-                   iTerm2                    -' $blue
e '-             Terminal emulator.              -' $blue
e '-             http://iterm2.com/              -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.googlecode.iterm2'

et "Don't display the annoying prompt when quitting."
dw PromptOnQuit -bool false

et 'Turn on dark mode.'
dw TabStyle -bool true
