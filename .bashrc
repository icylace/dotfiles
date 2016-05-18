[ -r ~/.my/aliases.sh ] && source ~/.my/aliases.sh

export PS1="$PS1\$(git-radar --bash --fetch) "

# Extra stuff that's too sensitive to be committed to a public repository.
[ -r ~/.not-public ] && source ~/.not-public
