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
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/cli/twa:$PATH"
export PATH="$HOME/cli/phpbrew:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.my/iTerm2:$PATH"

# # For Node.js.
# export PATH="$HOME/.node/bin:$PATH"
# export PATH="./node_modules/.bin:$PATH"

# For Rust.
export PATH="$HOME/.cargo/bin:$PATH"

# TODO: remove this?
# # Use the GNU Core Utilities with their normal names.
# coreutils_dir="$(brew --prefix coreutils)"
# export PATH="${coreutils_dir}/libexec/gnubin:$PATH"
# export MANPATH="${coreutils_dir}/libexec/gnuman:$MANPATH"

export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home/'
