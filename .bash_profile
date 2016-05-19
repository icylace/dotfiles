# http://superuser.com/a/789465
[ -f "$HOME/.profile" ] && source "$HOME/.profile"

# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
