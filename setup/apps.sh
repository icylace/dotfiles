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

# Homebrew Cask
# Manages the administration of Mac applications distributed as binaries.
# http://caskroom.io/
echo 'Installing Homebrew Cask'
brew install caskroom/cask/brew-cask

# Access alternate versions of programs.
# https://github.com/caskroom/homebrew-versions
brew tap caskroom/versions

# Access fonts.
# https://github.com/caskroom/homebrew-fonts
brew tap caskroom/fonts

# Make sure our Homebrew Cask recipes are updated as well.
brew cask update

cask_formulas=(

  # ----------------------------------------------------------------------------
  #  Applications.
  # ----------------------------------------------------------------------------

  # 1Password
  # Password manager.
  # https://agilebits.com/onepassword/mac
  #
  # Minimum requirements:
  # Yosemite
  #
  1password-beta

  # Adobe Reader
  # PDF reader.
  # http://www.adobe.com/products/reader.html
  adobe-reader

  # Alfred
  # Application launcher, search tool, and workflow tool.
  # http://www.alfredapp.com/
  alfred

  # AppCleaner
  # Application uninstaller.
  # http://freemacsoft.net/appcleaner/
  appcleaner

  # Asepsis
  # Redirects the creation of .DS_Store files into a special folder.
  # http://asepsis.binaryage.com/
  asepsis

  # aText
  # Text expander.
  # http://www.trankynam.com/atext/
  atext

  # Bartender
  # Menu bar manager.
  # http://www.macbartender.com/
  bartender

  # Boom 2
  # System-wide volume booster and equalizer.
  # http://globaldelight.com/boom/
  boom

  # BootChamp
  # Quickly reboots into the Windows.
  # http://kainjow.com/
  bootchamp

  # Cakebrew
  # GUI front end for Homebrew.
  # https://cakebrew.com/
  cakebrew

  # CheatSheet
  # Lists all active shortcut keys for the current application.
  # http://grandtotal.biz/CheatSheet/
  cheatsheet

  # ControllerMate
  # Input device remapper.
  # http://orderedbytes.com/controllermate/
  controllermate

  # DaisyDisk
  # Disk space analyzer.
  # http://daisydiskapp.com/
  daisydisk

  # Dash
  # Offline API documentation viewer and code snippet manager.
  # http://kapeli.com/dash
  dash

  # DockMod
  # Dock themer.
  # http://spyresoft.com/dockmod/
  dockmod

  # Dropbox
  # File sharer with cloud storage.
  # https://www.dropbox.com/
  dropbox

  # Firefox Developer Edition
  # Web browser with preinstalled web developer tools.
  # https://www.mozilla.org/en-US/firefox/developer/
  firefoxdeveloperedition

  # Flash Player
  # Flash media player web browser plugin.
  # http://get.adobe.com/flashplayer/
  flash-player

  # Flavours
  # System themer.
  # http://flavours.interacto.net/
  #
  # Yosemite support forth-coming:
  # https://interacto.zendesk.com/entries/53605899-Yosemite-and-the-future-Flavours-2
  #
  # flavours

  # Flux
  # Screen color temperature manager.
  # http://justgetflux.com
  flux

  # Google Chrome
  # Web browser.
  # http://www.google.com/chrome/
  google-chrome

  # Google Drive
  # File sharer with cloud storage.
  # https://drive.google.com/
  google-drive

  # Google Hangouts
  # Video conferencing web browser plugin.
  # https://google.com/tools/dlpage/hangoutplugin
  google-hangouts

  # HyperDock
  # Dock enhancer and window placement manager.
  # http://hyperdock.bahoom.com/
  hyperdock

  # HyperSwitch
  # Keyboard window switcher.
  # http://bahoom.com/hyperswitch
  hyperswitch

  # Integrity
  # Link checker for websites.
  # http://peacockmedia.co.uk/integrity/
  integrity

  # iStat Menus 5
  # System monitor.
  # http://bjango.com/mac/istatmenus/
  istat-menus

  # iTerm2
  # Terminal emulator.
  # http://iterm2.com/
  iterm2-beta

  # Kaleidoscope
  # File and folder comparison tool.
  # http://www.kaleidoscopeapp.com/
  kaleidoscope

  # KeepingYouAwake
  # System sleep manager.
  # https://github.com/newmarcel/KeepingYouAwake
  #
  # Minimum requirements:
  # Yosemite
  #
  keepingyouawake

  # LibreOffice
  # Office suite.
  # libreoffice.org
  libreoffice

  # Mactracker
  # Mac computer info database.
  # http://mactracker.ca/
  mactracker

  # nvALT
  # Notes manager.
  # http://brettterpstra.com/projects/nvalt/
  nvalt

  # OnyX
  # System maintenance utility.
  # http://www.titanium.free.fr/onyx.html
  onyx

  # Opera
  # Web browser.
  # http://www.opera.com/
  opera

  # Pacifist
  # Archive file manager.
  # http://charlessoft.com/
  pacifist

  # Path Finder
  # File manager.
  # http://cocoatech.com/pathfinder/
  path-finder

  # PhpStorm
  # PHP-oriented IDE.
  # https://www.jetbrains.com/phpstorm/
  phpstorm

  # Sequel Pro
  # MySQL database manager.
  # http://nightly.sequelpro.com/
  sequel-pro-nightly

  # Shortcat
  # Keyboard tool that lets you "Click" buttons and control your apps.
  # http://shortcatapp.com/
  shortcat

  # Skype
  # VoIP and video conferencing client.
  # http://www.skype.com/en/
  skype

  # SourceTree
  # Git client.
  # http://sourcetreeapp.com/
  sourcetree

  # Sublime Text
  # Text editor.
  # http://www.sublimetext.com/3dev
  sublime-text-dev

  # Synergy
  # Keyboard and mouse switcher for multiple computers.
  # http://synergy-project.org/
  synergy

  # The Hit List
  # To-do list manager.
  # http://www.karelia.com/products/the-hit-list/mac.html
  the-hit-list

  # The Unarchiver
  # Archive file extractor.
  # http://unarchiver.c3.cx/unarchiver
  the-unarchiver

  # Transmission
  # BitTorrent client.
  # https://www.transmissionbt.com/
  transmission

  # Transmit
  # File transfer tool.
  # http://panic.com/transmit/
  transmit

  # Vagrant
  # Virtual development environment manager.
  # https://www.vagrantup.com/
  vagrant

  # VirtualBox
  # Virtual environment manager.
  # https://www.virtualbox.org/
  virtualbox

  # VLC
  # Media player.
  # http://www.videolan.org/vlc/
  vlc

  #
  # Considering:
  #

  # adobe-creative-cloud - use CS6 instead ?
  # macpaw-gemini
  # hazel - useful to me ?
  # justlooking - use xee instead ?
  # ripit - still useful ?
  # xact - still useful ?
  # xee - use justlooking instead ?
  # fontexplorer-x-pro - still useful ?
  # deeper
  # maintenance
  # tinkertool
  # mamp
  # clamxav
  # atom - still useful to mew ?
  # hex-fiend - useful to me ?
  # omnigraffle - still useful ?
  # omnigraffle-professional5 - still useful ?
  # skim - useful to me ?
  # xscope - still useful to me ?
  # carbon-copy-cloner - use time machine instead ?
  # jewelrybox - still useful ?
  # sitesucker - still useful ?
  # soundflower - still useful ?
  # breakaway - anything better ?  (command line stuff maybe ?)
  # copy - still useful ?
  # readcube - useful to me ?
  # pdfpenpro - still useful ?
  # thunderbird-beta - useful for archiving email ?


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


  #
  # Apps for work.
  #

  # # LastPass
  # # A password manager.
  # laspass
  # # Run `open -a 'LastPass Installer'` to complete installation.

)

# TODO
# check these:

# ...


brew cask install "${cask_formulas[@]}"

# Check if there are problems.
brew cask doctor


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
# Text document manager and editor designed for writing.
# http://ulyssesapp.com/

# Xcode
# Application development system from Apple.
# https://developer.apple.com/xcode/

# cobook - still useful ?
# shazam - useful to me ?
# celtx - still useful ?
# tunatic - useful to me ?
# colorchooser ?
# fontdoctor ?
# fontvista ?
# Adobe CC ?
# Adobe CS6 - use CC instead ?
# winclone - still useful ?
# jackpilot - still useful ?
# plug spy - still useful ?
# folderteint - anything better ?
# hourguard - still useful ?
# time track pro - still useful ?
# sugarsync - still useful ?
# elephant drive - still useful ?
# shade - still useful ?
# iserial reader - still useful to mew ?

# Tagger
# http://hasseg.org/tagger/
# - anything better ?


# ------------------------------------------------------------------------------
#  Apps to install manually.
# ------------------------------------------------------------------------------

# Obsidian Menu Bar
# A hack that makes your OS X menu bar black.
# http://obsidianmenubar.com/

# Neat
# http://www.neat.com/


# Modify Alfred's search scope to include the Caskroom directory where Applications are stored.
brew cask alfred link


# brew cask install dropbox --force --download

# Upgrading Casks
# https://github.com/caskroom/homebrew-cask/issues/7884#issuecomment-66114740
# brew cask uninstall --force <token> && brew cask install <token>.

# Make sure we longer have any unnecessary files laying around.
brew cleanup
brew cask cleanup

# Reboot the system because some apps require a restart before becoming active.
sudo shutdown -r now 'Rebooting now...'
