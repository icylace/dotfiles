# ------------------------------------------------------------------------------
#  Google Chrome
#  Web browser.
#  http://www.google.com/chrome/
# ------------------------------------------------------------------------------

echo "\tDisable two-finger swipe navigation."
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
