# ------------------------------------------------------------------------------
#  Setup Homebrew.
# ------------------------------------------------------------------------------

# Install Homebrew if we need to.
if [ ! "$(which brew)" ]; then
  # Homebrew
  # Package manager for OS X.
  # http://brew.sh
  e 'Installing homebrew...'
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

#
# Other formulas.
#

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
