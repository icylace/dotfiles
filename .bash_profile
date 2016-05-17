# http://superuser.com/a/789465
if [ -f ~/.profile ] ; then
  source ~/.profile
fi

# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
if [ -f ~/.bashrc ] ; then
  source ~/.bashrc
fi
