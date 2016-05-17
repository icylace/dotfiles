if [ -f ~/.aliases ] ; then
  source ~/.aliases
fi

export PS1="$PS1\$(git-radar --bash --fetch) "

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -d ~/.extra ] ; then
  source ~/.extra
fi
