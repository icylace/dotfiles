# https://perlgeek.de/en/article/set-up-a-clean-utf8-environment
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# https://stackoverflow.com/a/5545748
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.my/iTerm2:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

# Alternative to `postgres -D /usr/local/var/postgres`.
export PGDATA="/usr/local/var/postgres"

# TODO: remove this?
# # Use the GNU Core Utilities with their normal names.
# # http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# coreutils_dir="$(brew --prefix coreutils)"
# export PATH="${coreutils_dir}/libexec/gnubin:$PATH"
# export MANPATH="${coreutils_dir}/libexec/gnuman:$MANPATH"

export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home/'

if which rbenv > /dev/null ; then
  eval "$(rbenv init -)"
fi

# Suggested by the caveats section from `brew info pyenv`.
if which pyenv > /dev/null ; then
  eval "$(pyenv init -)"
fi
