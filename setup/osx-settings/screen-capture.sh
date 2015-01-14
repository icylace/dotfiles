# ------------------------------------------------------------------------------
#  Screen capture settings.
# ------------------------------------------------------------------------------

e '\tDisable the shadow in screenshots.'
defaults write com.apple.screencapture disable-shadow -bool true

e '\tSave screenshots into the downloads folder to keep the desktop uncluttered.'
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

e '\tSet the screenshot base name.'
defaults write com.apple.screencapture name -string 'screen'

e '\tUse JPEG instead of PNG for smaller file sizes.'
defaults write com.apple.screencapture type -string 'jpg'
# Other options: BMP, GIF, JPG, PDF, TIFF

# # Restart SystemUIServer to apply the settings.
# killall SystemUIServer
