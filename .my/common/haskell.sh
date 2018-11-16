#!/usr/bin/env bash

export PATH="$HOME/.local/bin:$PATH"

# ------------------------------------------------------------------------------

# Enable shell autocompletions.
# https://docs.haskellstack.org/en/stable/shell_autocompletion/#for-zsh-users

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

eval "$(stack --bash-completion-script stack)"

# ------------------------------------------------------------------------------

# `-fno-code`:  Don't generate code.  Useful for type checking.
# https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/phases.html#ghc-flag--fno-code

#  `-Werror`:  Treat all warnings like fatal errors.
#  https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/using-warnings.html#ghc-flag--Werror

#  `-Weverything`:  Utilize every warning.
# https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/using-warnings.html#ghc-flag--Weverything

alias hc='stack ghc -- -Werror -outputdir=output'
alias hct='stack ghc -- -Werror -fno-code'
alias hi='stack ghci'
alias hie='stack ghci --ghc-options=-Weverything'
alias hrun='stack runghc -- -Werror'

# Update to the latest LTS Haskell snapshot.
# https://docs.haskellstack.org/en/stable/faq/#what-version-of-ghc-is-used-when-i-run-something-like-stack-ghci
alias hlts='stack config set resolver lts'

# Uninstall a package.
# https://stackoverflow.com/a/37237777
alias hun='stack exec -- ghc-pkg unregister --force'

alias ho='stack hoogle'
alias hoi='stack hoogle --info'
alias hor='stack hoogle generate && stack hoogle --rebuild'

# https://kseo.github.io/posts/2014-01-27-GHC-typecheck-build
alias htc='stack ghc -fforce-recomp -fno-code'

# Runs tests.
ht() {
  if [ -n $1 ] ; then
    stack test
  else
    # Run a specific given test.
    stack test --test-arguments="--match '$1'"
  fi
}

# ------------------------------------------------------------------------------

# Customizes the colors the GHC compiler and GHCi REPL environment use when they
# display compiler messages.
ghc_message_colors() {
  local h='header=38;2;255;255;180'
  local m='message=38;2;80;237;110'
  local w='warning=38;2;237;194;2'
  local e='error=1;38;2;255;50;110'
  local f='fatal=1;31'
  local g='margin=1;38;2;0;100;155'

  # https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/using.html#ghc-flag--fdiagnostics-color=%E2%9F%A8always|auto|never%E2%9F%A9
  export GHC_COLORS="$h:$m:$w:$e:$f:$g"
}

ghc_message_colors
