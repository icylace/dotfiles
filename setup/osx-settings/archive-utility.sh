# ------------------------------------------------------------------------------
#  Archive utility settings.
# ------------------------------------------------------------------------------

e '\tMove archive files to trash after expansion.'
defaults write com.apple.archiveutility dearchive-move-after -string '~/.Trash'
# Other values:
#   /dev/null = delete directly
#   . = leave alone (default)
