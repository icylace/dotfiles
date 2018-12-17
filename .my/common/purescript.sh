#!/usr/bin/env bash

# https://github.com/ThomasCrevoisier/psvm-js#installation
export PATH="$HOME/.psvm/current/bin:$PATH"

# Builds a PureScript project.
alias pb='pulp --psc-package build'

# Builds a PureScript project using dead code elimination.
alias pbo='pulp --psc-package build --optimise'

# Runs PSCi, the PureScript REPL environment.
alias pi='pulp --psc-package psci'

# Executes a PureScript project.
alias px='pulp --psc-package run'
