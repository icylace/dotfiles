# e ''
# e '-----------------------------------------------' $blue
# e '-                  Firewall                   -' $blue
# e '-----------------------------------------------' $blue
# e ''

# et 'Enable the OS X firewall.'
# sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
# # Possible values:
# #   0 = off
# #   1 = on for specific services
# #   2 = on for essential services

# et 'Enable Stealth mode.'
# sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

# et 'Enable Firewall logging.'
# sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -int 1

# et 'Reload the firewall.'
# launchctl unload /System/Library/LaunchAgents/com.apple.alf.useragent.plist
# sudo launchctl unload /System/Library/LaunchDaemons/com.apple.alf.agent.plist
# sudo launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist
# launchctl load /System/Library/LaunchAgents/com.apple.alf.useragent.plist
