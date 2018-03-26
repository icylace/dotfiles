source "$HOME/.my/common.sh"

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -f "$HOME/.not-public/extra.sh" ] ; then
  source "$HOME/.not-public/extra.sh"
fi

export PATH="$PATH:/Applications/DevDesktop/tools"
