e ''
e '-----------------------------------------------' $blue
e '-                    Mail                     -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.apple.mail'

et 'Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>`.'
dw AddressesIncludeNameOnPasteboard -bool false

# et 'Disable inline attachments (just show the icons).'
# dw DisableInlineAttachmentViewing -bool true

# et 'Disable send and reply animations.'
# dw DisableReplyAnimations -bool true
# dw DisableSendAnimations -bool true

# et 'Display emails in threaded mode, sorted by date (oldest at the top).'
# dw DraftsViewerAttributes -dict-add 'DisplayInThreadedMode' -string 'yes'
# dw DraftsViewerAttributes -dict-add 'SortedDescending' -string 'yes'
# dw DraftsViewerAttributes -dict-add 'SortOrder' -string 'received-date'

# et 'Add the keyboard shortcut ⌘ + Enter to send an email.'
# dw NSUserKeyEquivalents -dict-add 'Send' -string '@\\U21a9'

# et 'Disable automatic spell checking.'
# dw SpellCheckingBehavior -string 'NoSpellCheckingEnabled'
