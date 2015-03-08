e ''
e '-----------------------------------------------' $blue
e '-                Homebrew Cask                -' $blue
e '-----------------------------------------------' $blue
e ''

# Homebrew Cask
# Manages the administration of Mac applications distributed as binaries.
# http://caskroom.io/
et 'Installing Homebrew Cask'
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

et 'Installing casks...'
brew cask install $(cat brews/casks.brew | grep -v \#)

# Check if there are problems.
brew cask doctor

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

# atom

# atom-shell

# https://github.com/ttscoff/reiki/blob/master/reiki.plugin.bash#L298

# https://gist.github.com/brandonb927/3195465

# # Default Folder X
# # Open and Save dialog box enhancer.
# # http://stclairsoft.com/DefaultFolderX/
# default-folder-x
# There is a Cask for it but it needs fixing.  The workaround is to install manually.

# # LastPass
# # A password manager.
# lastpass
# # Run `open -a 'LastPass Installer'` to complete installation.

# lighttable

# Flavours
# System themer.
# http://flavours.interacto.net/
#
# Yosemite support forth-coming:
# https://interacto.zendesk.com/entries/53605899-Yosemite-and-the-future-Flavours-2
#
# flavours
