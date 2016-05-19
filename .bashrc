source "$HOME/.my/aliases.sh"
source "$HOME/.my/git.sh"
source "$HOME/.my/laravel.sh"
source "$HOME/.my/xcode.sh"

export PS1="$PS1\$(git-radar --bash --fetch) "

# Extra stuff that's too sensitive to be committed to a public repository.
[ -f "$HOME/.not-public" ] && source "$HOME/.not-public"
