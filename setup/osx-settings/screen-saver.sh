# ------------------------------------------------------------------------------
#  Screen saver settings.
# ------------------------------------------------------------------------------

echo '\tRequire password immediately after sleep or screensaver begins.'
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
