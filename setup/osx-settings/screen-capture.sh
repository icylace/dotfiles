e ''
e '###############################################' $blue
e '#               SCREEN CAPTURE                #' $blue
e '###############################################' $blue
e ''

alias dw='defaults write com.apple.screencapture'

e '\tDisable the shadow in screenshots.'
dw disable-shadow -bool true

e '\tSave screenshots into the downloads folder to keep the desktop uncluttered.'
dw location -string "${HOME}/Downloads"

e '\tSet the screenshot base name.'
dw name -string 'screen'

e '\tUse JPEG instead of PNG for smaller file sizes.'
dw type -string 'jpg'
# Other options: BMP, GIF, JPG, PDF, TIFF

# # Restart SystemUIServer to apply the settings.
# killall SystemUIServer
