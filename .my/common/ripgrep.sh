#!/usr/bin/env bash

# Searches for text within files using ripgrep.
# https://github.com/BurntSushi/ripgrep
alias s="rg --column --hidden --no-search-zip --smart-case --stats"

# Do text searches while ignoring folders commonly found in web projects.
alias sn="s --ignore-file=dist --ignore-file=node_modules --ignore-file=web_modules"
