if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -d ~/.extra ]; then
  source ~/.extra
fi
