source "$HOME/.my/common.sh"

# Based on:
# From the installation notes for z.
source /usr/local/etc/profile.d/z.sh

# Based on:
# From installation notes for `brew install bash-completion@2`.
if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] ; then
  source "/usr/local/etc/profile.d/bash_completion.sh"
fi

# Based on:
# https://github.com/phpbrew/phpbrew#installation
if [[ -e "$HOME/.phpbrew/bashrc" ]] ; then
  source "$HOME/.phpbrew/bashrc"
fi

# Extra stuff that's too sensitive to be committed to a public repository.
if [ -f "$HOME/.not-public/extra.sh" ] ; then
  source "$HOME/.not-public/extra.sh"
fi

# TODO: try this ?
# From debian:experimental docker image:
#
# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022
