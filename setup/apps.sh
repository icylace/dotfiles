#!/usr/bin/env bash

#
# Heavy influence (and sometimes direct copying) from:
# https://mths.be/osx
# https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
# http://www.defaults-write.com/
#

#
# http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# https://github.com/kevinrenskers/dotfiles
#

# Homebrew
# Package manager for OS X.
# http://brew.sh

# Check for Homebrew and install if we don't have it.
if [ ! "$(which brew)" ]; then
  echo 'Installing homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check if there are problems.
brew doctor

# Update Homebrew recipes.
brew update

formulas=(

  # Homebrew Cask
  # Manages the administration of Mac applications distributed as binaries.
  # http://caskroom.io/
  caskroom/cask/brew-cask

)

echo 'Installing Homebrew formulas...'
brew install "${formulas[@]}"

# Access alternate versions of programs.
# https://github.com/caskroom/homebrew-versions
brew tap caskroom/versions

# Access fonts.
# https://github.com/caskroom/homebrew-fonts
brew tap caskroom/fonts

cask_formulas=(

  # ----------------------------------------------------------------------------
  #  Applications.
  # ----------------------------------------------------------------------------

  # adobe-creative-cloud - use CS6 instead ?

  # 1password - use beta instead ?

  # Yosemite-only.
  1password-beta

  # Alfred
  # http://www.alfredapp.com/
  alfred

  #
  #
  appcleaner

  # Asepsis
  # Redirects the creation of .DS_Store files into a special folder.
  # http://asepsis.binaryage.com/
  asepsis

  #
  #
  atext

  #
  #
  bartender

  #
  #
  boom

  #
  #
  bootchamp

  # Cakebrew
  # A GUI front end for Homebrew.
  # https://cakebrew.com/
  cakebrew

  # CheatSheet
  # http://grandtotal.biz/CheatSheet/
  cheetsheet

  #
  #
  controllermate

  #
  #
  daisydisk

  #
  #
  dash

  # http://spyresoft.com/dockmod/
  dockmod

  #
  #
  dropbox

  #
  #
  firefoxdeveloperedition

  #
  #
  flash-player

  #
  #
  flavours

  #
  #
  flux

  #
  #
  google-chrome

  #
  #
  google-drive

  #
  #
  google-hangouts

  #
  #
  hyperdock

  #
  #
  hyperswitch

  # Integrity
  # Checks for any broken links on a website.
  # http://peacockmedia.co.uk/integrity/
  integrity

  #
  #
  istat-menus

  #
  #
  iterm2-beta

  #
  #
  kaleidoscope

  # KeepingYouAwake
  # Menu bar utility for 10.10+ that prevents your Mac from going to sleep.
  # https://github.com/newmarcel/KeepingYouAwake
  keepingyouawake

  #
  #
  libreoffice

  #
  #
  mactracker

  #
  #
  nvalt

  # OnyX
  # System maintenance utility.
  # http://www.titanium.free.fr/onyx.html
  onyx

  #
  #
  opera

  #
  #
  pacifist

  #
  #
  path-finder

  #
  #
  phpstorm

  #
  #
  sequel-pro-nightly

  # Shortcat
  # http://shortcatapp.com/
  # "Click" buttons and control your apps with the keyboard.
  shortcat

  #
  #
  skype

  #
  #
  sourcetree

  #
  #
  sublime-text-dev

  #
  #
  synergy

  #
  #
  the-hit-list

  #
  #
  the-unarchiver

  #
  #
  transmission

  #
  #
  transmit

  #
  #
  vagrant

  #
  #
  virtualbox


  # hazel - useful to me ?
  # justlooking - use xee instead ?
  # mpv - use vlc instead ?
  # ripit - still useful ?
  # vlc - use mpv instead ?
  # xact - still useful ?
  # xee - use justlooking instead ?
  # fontexplorer-x-pro - still useful ?
  # deeper
  # maintenance
  # tinkertool
  # mamp
  # clamxav




  # ----------------------------------------------------------------------------
  #  Quick Look plugins.
  # ----------------------------------------------------------------------------

  # BetterZip Quick Look Generator
  # Previews archives.
  # http://macitbetter.com/BetterZip-Quick-Look-Generator/
  betterzipql

  # qlcolorcode
  # Previews source code files with syntax highlighting.
  # https://code.google.com/p/qlcolorcode/
  qlcolorcode

  # QLMarkdown
  # Previews Markdown files.
  # https://github.com/toland/qlmarkdown
  qlmarkdown

  # QLPrettyPatch
  # Previews .patch files.
  # https://github.com/atnan/QLPrettyPatch
  qlprettypatch

  # QuicklookStephen
  # Previews plain text files without a file extension.
  # https://github.com/whomwah/qlstephen
  qlstephen

  # A QuickLook Plugin for CSV Files
  # Previews CSV files.
  # https://github.com/p2/quicklook-csv
  quicklook-csv

  # quick look JSON
  # Previews JSON files.
  # http://sagtau.com/quicklookjson
  quicklook-json

  # Suspicious Package
  # Previews the contents of a standard Apple installer package.
  # http://www.mothersruin.com/software/SuspiciousPackage/
  suspicious-package

  # WebP QuickLook Plugin
  # Previews WebP images.
  # https://github.com/dchest/webp-quicklook
  webp-quicklook


  # ----------------------------------------------------------------------------
  #  Fonts.
  # ----------------------------------------------------------------------------

  # Input
  # http://input.fontbureau.com/
  font-input

  # M+
  # http://mplus-fonts.sourceforge.jp/mplus-outline-fonts/design/index-en.html
  font-m-plus

  # Source Code Pro
  # http://adobe-fonts.github.io/source-code-pro/
  font-source-code-pro
)

# TODO
# - check these:
#   - gemini
#   - adobe reader
#   - skim
#   - omnigraffle pro ?

#   - hex fiend - useful to me ?

#   - atom - still useful to mew ?
#   - iserial reader - still useful to mew ?
#   - xscope - still useful to me ?
#   - terminal-notifier - useful to me ?
#   - carbon copy cloner - use time machine instead ?
#   - shazam - useful to me ?
#   - jewelrybox - still useful ?
#   - sitesucker - still useful ?
#   - tunatic - useful to me ?
#   - winclone - still useful ?
#   - soundflowerbed - still useful ?
#   - jackpilot - still useful ?
#   - breakaway - anything better ?  (command line stuff maybe ?)
#   - plug spy - still useful ?
#   - celtx - still useful ?
#   - folderteint - anything better ?
#   - hourguard - still useful ?
#   - time track pro - still useful ?
#   - copy - still useful ?
#   - sugarsync - still useful ?
#   - elephant drive - still useful ?
#   - readcube - useful to me ?
#   - pdfpenpro - still useful ?
#   - shade - still useful ?
#   - thunderbird - useful for archiving email ?
#   - ...

# Tagger
# http://hasseg.org/tagger/
# - anything better ?

brew cask install "${cask_formulas[@]}"


# ------------------------------------------------------------------------------
#  Apps to install manually via the Mac App Store.
# ------------------------------------------------------------------------------

# CodeBox
# Code snippets manager.
# http://www.shpakovski.com/codebox/

# DragonDrop
# File dragging helper.
# https://shinyplasticbag.com/dragondrop/

# Memory Clean
# Frees up unused memory.
# https://fiplab.com/apps/memory-clean-for-mac

# Ulysses III
# Text document manager and editor.
# http://ulyssesapp.com/

# Xcode
# Application development system from Apple.
# https://developer.apple.com/xcode/


# ------------------------------------------------------------------------------
#  Apps to install manually.
# ------------------------------------------------------------------------------

# cobook ?


# colorchooser ?
# fontdoctor ?
# fontvista ?

# Adobe CC ?
# Adobe CS6 - use CC instead ?

# Neat
# http://www.neat.com/


# Modify Alfred's search scope to include the Caskroom directory where Applications are stored.
brew cask alfred link


# brew cask install dropbox --force --download




# Upgrading Casks
# https://github.com/caskroom/homebrew-cask/issues/7884#issuecomment-66114740
# brew cask uninstall --force <token> && brew cask install <token>.


# Reboot the system because some apps require a restart before becoming active.
sudo shutdown -r now 'Rebooting now...'
