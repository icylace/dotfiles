e ''
e '-----------------------------------------------' $blue
e '-                Homebrew Cask                -' $blue
e '-----------------------------------------------' $blue
e ''

# Homebrew Cask
# Manages the administration of Mac applications distributed as binaries.
# http://caskroom.io/
e 'Installing Homebrew Cask'
brew install caskroom/cask/brew-cask

# Check if there are problems.
brew doctor

# Access alternate versions of programs.
# https://github.com/caskroom/homebrew-versions
brew tap caskroom/versions

# Access fonts.
# https://github.com/caskroom/homebrew-fonts
brew tap caskroom/fonts

# Make sure our Homebrew Cask recipes are updated.
brew cask update

e 'Installing casks...'
brew cask install $(cat brews/casks.brew | grep -v \#)

# Check if there are problems.
brew cask doctor

# Modify Alfred's search scope to include the Caskroom directory where Applications are stored.
# https://github.com/caskroom/homebrew-cask/issues/8052#issuecomment-66736053
defaults write com.runningwithcrayons.Alfred-Preferences syncfolder -string '~/My/Dropbox/Sync/Alfred Preferences'
brew cask alfred link

# Make sure we longer have any unnecessary files laying around.
brew cleanup
brew cask cleanup

# # Activate the Quick Look plugins.
# qlmanage -r


# brew cask install dropbox --force --download

# Upgrading Casks
# https://github.com/caskroom/homebrew-cask/issues/7884#issuecomment-66114740
# brew cask uninstall --force <token> && brew cask install <token>.

#
# Other casks.
#

# # Default Folder X
# # Open and Save dialog box enhancer.
# # http://stclairsoft.com/DefaultFolderX/
# default-folder-x
# There is a Cask for it but it needs fixing.

# # LastPass
# # A password manager.
# lastpass
# # Run `open -a 'LastPass Installer'` to complete installation.

# Flavours
# System themer.
# http://flavours.interacto.net/
#
# Yosemite support forth-coming:
# https://interacto.zendesk.com/entries/53605899-Yosemite-and-the-future-Flavours-2
#
# flavours
