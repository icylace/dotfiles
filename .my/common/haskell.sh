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

alias hb='stack build --ghc-options=-Werror'
alias hc='stack ghc -- -Werror -outputdir=output'
alias hct='stack ghc -- -Werror -fno-code'
alias hi='stack ghci'
alias hie='stack ghci --ghc-options=-Weverything'
alias hrun='stack runghc -- -Werror'
alias hx='stack exec'

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

# Run this after upgrading to a new Stackage (https://www.stackage.org/) release.
haskell_rebuild_tools() {
  # stack build --copy-compiler-tool brittany
  # stack build --copy-compiler-tool floskell
  # stack build --copy-compiler-tool stylish-haskell

  # http://hackage.haskell.org/package/haskell-formatter
  # https://github.com/danstiner/hfmt

  # TODO: keep an eye on:
  # Ormulu
  # https://github.com/tweag/ormolu

  # ghcid
  # GHCi based bare bones IDE
  # https://github.com/ndmitchell/ghcid
  # https://www.parsonsmatt.org/2018/05/19/ghcid_for_the_win
  # http://hackage.haskell.org/package/ghcid
  stack build --copy-compiler-tool ghcid

  # hindent
  # Haskell pretty printer
  # https://chrisdone.com/posts/hindent/
  # https://github.com/chrisdone/hindent
  # https://hackage.haskell.org/package/hindent
  stack build --copy-compiler-tool hindent

  # HLint
  # Haskell source code suggestions
  # https://github.com/ndmitchell/hlint
  # http://community.haskell.org/~ndm/darcs/hlint/hlint.htm
  # http://hackage.haskell.org/package/hlint
  stack build --copy-compiler-tool hlint

  # Hoogle
  # Haskell API search engine
  # https://github.com/ndmitchell/hoogle
  # https://hoogle.haskell.org/
  # http://hackage.haskell.org/package/hoogle
  stack build --copy-compiler-tool hoogle

  # TODO:
  # - necessary to run this every time ?
  #
  # # https://github.com/ndmitchell/hoogle/blob/master/docs/Install.md#index-all-of-stackage
  # stack hoogle generate

  # hscolour
  # Colourise Haskell code.
  # https://hackage.haskell.org/package/hscolour
  stack build --copy-compiler-tool hscolour

  # # intero
  # # Complete interactive development program for Haskell
  # # https://github.com/commercialhaskell/intero
  # # https://github.com/commercialhaskell/intero/blob/master/TOOLING.md#installing
  # # https://hackage.haskell.org/package/intero
  # stack build --copy-compiler-tool intero

  # pretty-show
  # Tools for working with derived `Show` instances and generic inspection of values.
  # https://github.com/yav/pretty-show
  # https://hackage.haskell.org/package/pretty-show
  stack build --copy-compiler-tool pretty-show

  # # prettyprinter
  # # A modern, easy to use, well-documented, extensible pretty-printer.
  # # https://github.com/quchen/prettyprinter
  # # https://hackage.haskell.org/package/prettyprinter
  # stack build --copy-compiler-tool prettyprinter

  # Weeder
  # Detect dead code
  # http://hackage.haskell.org/package/weeder
  stack build --copy-compiler-tool weeder
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
