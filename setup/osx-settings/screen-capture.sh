e ''
e '-----------------------------------------------' $blue
e '-               Screen Capture                -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.apple.screencapture'

et 'Disable the shadow in screenshots.'
dw disable-shadow -bool true

et 'Save screenshots into the downloads folder to keep the desktop uncluttered.'
dw location -string "${HOME}/Downloads"

et 'Set the screenshot base name.'
dw name -string 'screen'

et 'Use JPEG instead of PNG for smaller file sizes.'
dw type -string 'jpg'
# Other options: BMP, GIF, JPG, PDF, TIFF

# et 'Restart SystemUIServer to apply the settings.'
# killall SystemUIServer
