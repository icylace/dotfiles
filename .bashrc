source "$HOME/.my/aliases.sh"
source "$HOME/.my/git.sh"

export PS1="$PS1\$(git-radar --bash --fetch) "

# Extra stuff that's too sensitive to be committed to a public repository.
source "$HOME/.not-public"
