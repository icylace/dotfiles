# ------------------------------------------------------------------------------
#  Text Edit settings.
# ------------------------------------------------------------------------------

e '\tOpen and save files as UTF-8.'
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

e '\tUse plain text mode for new documents.'
defaults write com.apple.TextEdit RichText -int 0
