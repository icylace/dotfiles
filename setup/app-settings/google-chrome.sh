# ------------------------------------------------------------------------------
#  Google Chrome
#  Web browser.
#  http://www.google.com/chrome/
# ------------------------------------------------------------------------------

e '\tDisable two-finger swipe navigation.'
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

e '\tAllow installing user scripts via GitHub Gist or Userscripts.org.'
defaults write com.google.Chrome ExtensionInstallSources -array 'https://gist.githubusercontent.com/' 'http://userscripts.org/*'
defaults write com.google.Chrome.canary ExtensionInstallSources -array 'https://gist.githubusercontent.com/' 'http://userscripts.org/*'
