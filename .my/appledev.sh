#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#  Swift-related
# ------------------------------------------------------------------------------

# https://swiftenv.fuller.li/en/latest/installation.html#via-homebrew
if which swiftenv > /dev/null ; then
  eval "$(swiftenv init -)"
fi

# https://github.com/apple/swift-package-manager#installing
export TOOLCHAINS=swift

alias swb='swift build'
alias swe='swiftenv'

# Starts the Swift REPL or runs a given Swift file.
sw() {
  if [ -z "$1" ] ; then
    swift
  elif [ -f "$1".swift ] ; then
    swift "$1".swift
  elif [ -f "$1" ] ; then
    swift "$1"
  else
    echo 'Error: Not a Swift file.'
    return 1
  fi
}

# Initiates a new Swift project in the current directory.
swi() {
  if [ -z "$1" ] ; then
    echo 'Initiates a new Swift project in the current directory.'
    echo
    echo 'Usage: swi <project name>'
    return
  fi
  mkdir "$1"
  cd "$1"
  swiftenv local DEVELOPMENT-SNAPSHOT-2016-06-20-a
  swift package init --type executable
  swift package generate-xcodeproj
}


# ------------------------------------------------------------------------------
#  Xcode-related
# ------------------------------------------------------------------------------

x() {
  # Attempt to build the project and get out if there was an error.
  xb
  if [ $? -ne 0 ] ; then
    return
  fi

  # If no scheme name is provided by the caller then
  # get the scheme name from the current directory.
  local scheme="$1"
  if [ -z "$scheme" ] ; then
    scheme=$(basename "$(pwd)")
  fi

  local config='Debug'        # May also be set to "Release".
  local sdk='iphonesimulator'

  local app="./output/Build/Products/$config-$sdk/$scheme.app"
  local bundle_id="com.sleepytimebacon.$scheme"

  xcrun simctl install booted "$app"
  xcrun simctl launch booted "$bundle_id"
}

xb() {
  # If no scheme name is provided by the caller then
  # get the scheme name from the current directory.
  local scheme="$1"
  if [ -z "$scheme" ] ; then
    scheme=$(basename "$(pwd)")
  fi

  local config='Debug'        # May also be set to "Release".
  local sdk='iphonesimulator'

  local data_path='./output'
  local platform='iOS Simulator'
  local device='iPhone 5s'
  local os='9.2'
  local dest="platform=$platform,name=$device,OS=$os"

  xctool                          \
    -configuration "$config"      \
    -derivedDataPath "$data_path" \
    -destination "$dest"          \
    -reporter pretty              \
    -scheme "$scheme"             \
    -sdk "$sdk"                   \
    build
}

# Load/reload the simulator.
xl() {
  local device='iPhone 5s'
  local os='iOS 9.2'
  local udid=$(xcrun simctl list --json devices | jq ".devices.\"$os\" | .[] | select(.name==\"$device\") | .udid")
  xq
  open -a 'Simulator' --args -CurrentDeviceUDID "$udid"
}

# Quit the simulator.
xq() {
  local running
  running=$(pgrep -x 'Simulator' | wc -l)
  if [ "$running" -gt 0 ] ; then
    osascript -e 'quit app "Simulator"'
  fi
}

# Reset all the simulators.
# http://stackoverflow.com/a/33818402
xr() {
  xq
  xcrun simctl erase all
}
