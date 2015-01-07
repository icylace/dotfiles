# ------------------------------------------------------------------------------
#  Setup Homebrew.
# ------------------------------------------------------------------------------

# We're focusing on OS X so abort if we're not in OS X.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

install_formulas() {

  # Install Homebrew if we need to.
  if [ ! "$(which brew)" ]; then
    # Homebrew
    # Package manager for OS X.
    # http://brew.sh
    echo 'Installing homebrew...'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Check if there are problems.
  brew doctor

  # Update Homebrew recipes.
  brew update

  # Access more recent versions of some programs that come with OS X.
  brew tap homebrew/dupes

  # Access PHP-related formulas.
  brew tap homebrew/homebrew-php

  echo 'Installing formulas...'
  brew install $(cat brews/formulas.brew | grep -v \#)

  # Check if there are problems.
  brew doctor

  # Make sure we longer have any unnecessary files laying around.
  brew cleanup

}

install_casks() {

  # Homebrew Cask
  # Manages the administration of Mac applications distributed as binaries.
  # http://caskroom.io/
  echo 'Installing Homebrew Cask'
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

  echo 'Installing casks...'
  brew cask install $(cat brews/casks.brew | grep -v \#)

  # Check if there are problems.
  brew cask doctor

  # # Modify Alfred's search scope to include the Caskroom directory where Applications are stored.
  # # https://github.com/caskroom/homebrew-cask/issues/8052#issuecomment-66736053
  # defaults read com.runningwithcrayons.Alfred-Preferences syncfolder
  # brew cask alfred link

  # Make sure we longer have any unnecessary files laying around.
  brew cleanup
  brew cask cleanup

  # Activate the Quick Look plugins.
  qlmanage -r


  # brew cask install dropbox --force --download

  # Upgrading Casks
  # https://github.com/caskroom/homebrew-cask/issues/7884#issuecomment-66114740
  # brew cask uninstall --force <token> && brew cask install <token>.

}

install_formulas
install_casks


# ------------------------------------------------------------------------------
#  Other formulas.
# ------------------------------------------------------------------------------

# # GNU Aspell
# # Spell checker.
# # http://aspell.net/
# aspell

# # Composer
# # Dependency manager for PHP.
# # http://getcomposer.org/
# #
# # https://github.com/composer/composer/pull/3523#issuecomment-66768640
# # https://github.com/composer/composer/issues/3255#issuecomment-60742259
# #
# composer

# # FFmpeg
# # Audio and video converter, recorder, and streamer.
# # http://ffmpeg.org/
# ffmpeg

# # id3tool
# # ID3 tag editor.
# # http://nekohako.xware.cx/id3tool/
# id3tool

# # Pipe Viewer
# # Progress monitor for data through a pipeline.
# # http://ivarch.com/programs/pv
# pv

# # spark
# # Data visualizer using sparklines.
# # http://zachholman.com/spark/
# spark

# # terminal-notifier
# # Send Mac OS X User Notifications.
# # https://github.com/alloy/terminal-notifier
# terminal-notifier

# # Generic Colouriser
# # Colorizes output of commands and log files.
# # http://korpus.juls.savba.sk/~garabik/software/grc.html
# grc


# ------------------------------------------------------------------------------
#  Other casks.
# ------------------------------------------------------------------------------

# # Kaleidoscope
# # File and folder comparison tool.
# # http://www.kaleidoscopeapp.com/
# kaleidoscope
# # Seeing how Beyond Compare works out.

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
