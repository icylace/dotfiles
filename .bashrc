# http://kvz.io/blog/2012/10/03/quick-server-debugging-with-wtf/
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:/Applications/DevDesktop/drush"

export NVM_DIR="~/.nvm"
source $(brew --prefix nvm)/nvm.sh
