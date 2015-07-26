e ''
e '-----------------------------------------------' $blue
e '-                Google Chrome                -' $blue
e '-                 Web browser.                -' $blue
e '-        http://www.google.com/chrome/        -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.google.Chrome'

et 'Disable two-finger swipe navigation.'
dw AppleEnableSwipeNavigateWithScrolls -bool false

et 'Allow installing user scripts via GitHub Gist or Userscripts.org.'
dw ExtensionInstallSources -array 'https://gist.githubusercontent.com/' 'http://userscripts.org/*'

# ------------------------------------------------------------------------------

alias dw='defaults write com.google.Chrome.canary'

dw ExtensionInstallSources -array 'https://gist.githubusercontent.com/' 'http://userscripts.org/*'
