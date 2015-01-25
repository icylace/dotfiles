# We're focusing on OS X so abort if we're not in OS X.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Set useable colors.
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#
# Echo with color.
#
# Based on:
# https://gist.github.com/brandonb927/3195465#file-osx-for-hackers-sh-L24
#
e() {
  echo -e "${2}${1}"
  # Reset text attributes to normal without clearing screen.
  tput sgr0
}

#
# Indented echo with color.
#
et() {
  e "\t${1}" ${2}
}
