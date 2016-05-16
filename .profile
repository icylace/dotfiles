# http://stackoverflow.com/questions/5545715/how-do-i-add-usr-local-git-bin-to-the-path-on-mac-osx/5545748#5545748

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.node/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

# https://github.com/yyuu/pyenv/wiki/Common-build-problems#build-failed-error-the-python-zlib-extension-was-not-compiled-missing-the-zlib
export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"

# # Use the GNU Core Utilities with their normal names.
# # http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# coreutils_dir="$(brew --prefix coreutils)"
# export PATH="${coreutils_dir}/libexec/gnubin:$PATH"
# export MANPATH="${coreutils_dir}/libexec/gnuman:$MANPATH"

export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_72.jdk/Contents/Home/'

nvm_file="$(brew --prefix nvm)/nvm.sh"
if [ -f $nvm_file ] ; then
  # Recommended by Homebrew.
  export NVM_DIR=~/.nvm
  source $nvm_file
fi

# Suggested by the caveats section from `brew info rbenv`.
if which rbenv > /dev/null ; then
  eval "$(rbenv init -)"
fi

# Suggested by the caveats section from `brew info pyenv`.
if which pyenv > /dev/null ; then
  eval "$(pyenv init -)"
fi
