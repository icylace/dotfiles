e ''
e '###############################################' $blue
e '#                    MAIL                     #' $blue
e '###############################################' $blue
e ''

alias dw='defaults write com.apple.mail'

# e '\tCopy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>`.'
# dw AddressesIncludeNameOnPasteboard -bool false

# e '\tDisable inline attachments (just show the icons).'
# dw DisableInlineAttachmentViewing -bool true

# e '\tDisable send and reply animations.'
# dw DisableReplyAnimations -bool true
# dw DisableSendAnimations -bool true

# e '\tDisplay emails in threaded mode, sorted by date (oldest at the top).'
# dw DraftsViewerAttributes -dict-add 'DisplayInThreadedMode' -string 'yes'
# dw DraftsViewerAttributes -dict-add 'SortedDescending' -string 'yes'
# dw DraftsViewerAttributes -dict-add 'SortOrder' -string 'received-date'

# e '\tAdd the keyboard shortcut ⌘ + Enter to send an email.'
# dw NSUserKeyEquivalents -dict-add 'Send' -string '@\\U21a9'

# e '\tDisable automatic spell checking.'
# dw SpellCheckingBehavior -string 'NoSpellCheckingEnabled'
