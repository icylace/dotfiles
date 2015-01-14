# ------------------------------------------------------------------------------
#  Mail settings.
# ------------------------------------------------------------------------------

# e '\tCopy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>`.'
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# e '\tDisable inline attachments (just show the icons).'
# defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# e '\tDisable send and reply animations.'
# defaults write com.apple.mail DisableReplyAnimations -bool true
# defaults write com.apple.mail DisableSendAnimations -bool true

# e '\tDisplay emails in threaded mode, sorted by date (oldest at the top).'
# defaults write com.apple.mail DraftsViewerAttributes -dict-add 'DisplayInThreadedMode' -string 'yes'
# defaults write com.apple.mail DraftsViewerAttributes -dict-add 'SortedDescending' -string 'yes'
# defaults write com.apple.mail DraftsViewerAttributes -dict-add 'SortOrder' -string 'received-date'

# e '\tAdd the keyboard shortcut ⌘ + Enter to send an email.'
# defaults write com.apple.mail NSUserKeyEquivalents -dict-add 'Send' -string '@\\U21a9'

# e '\tDisable automatic spell checking.'
# defaults write com.apple.mail SpellCheckingBehavior -string 'NoSpellCheckingEnabled'
