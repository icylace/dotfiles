e ''
e '###############################################' $blue
e '#               ARCHIVE UTILITY               #' $blue
e '###############################################' $blue
e ''

alias dw='defaults write com.apple.archiveutility'

e '\tMove archive files to trash after expansion.'
dw dearchive-move-after -string '~/.Trash'
# Other values:
#   /dev/null = delete directly
#   .         = leave alone (default)
