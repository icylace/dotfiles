# Use aliases in common with Z shell.
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/local/sbin:${PATH}"
export PATH="${HOME}/.node/bin:${PATH}"
export PATH="${HOME}/.rbenv/bin:${PATH}"

export NVM_DIR="~/.nvm"
source $(brew --prefix nvm)/nvm.sh

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -d ~/.extra ]; then
  source ~/.extra
fi
