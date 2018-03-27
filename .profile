# https://stackoverflow.com/a/5545748

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.my/iTerm2:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

# ------------------------------------------------------------------------------

# TODO: remove this?
# # Use the GNU Core Utilities with their normal names.
# # http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# coreutils_dir="$(brew --prefix coreutils)"
# export PATH="${coreutils_dir}/libexec/gnubin:$PATH"
# export MANPATH="${coreutils_dir}/libexec/gnuman:$MANPATH"

export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home/'

if type brew > /dev/null 2>&1 ; then
  nvm_file="$(brew --prefix nvm)/nvm.sh"
  if [ -f "$nvm_file" ] ; then
    # Recommended by Homebrew.
    export NVM_DIR="$HOME/.nvm"
    source "$nvm_file"
  fi
fi

if which rbenv > /dev/null ; then
  eval "$(rbenv init -)"
fi

# Suggested by the caveats section from `brew info pyenv`.
if which pyenv > /dev/null ; then
  eval "$(pyenv init -)"
fi

# ------------------------------------------------------------------------------

# Alternative to `postgres -D /usr/local/var/postgres`.
export PGDATA="/usr/local/var/postgres"

export PATH="$PATH:/Applications/DevDesktop/tools"
