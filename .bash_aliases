alias cp='cp -i'
alias cl='clear'
alias gr='grep -R -E'
alias li='ls -lAG'

# https://github.com/yrammos/dotfiles/blob/master/.bashrc
alias .=pwd
alias mv='mv -i'

# http://www.techrepublic.com/blog/10things/cut-down-on-linux-command-line-typing-with-these-10-handy-bash-aliases/352
alias rm='rm -i'
alias df='df -h'

# http://stackoverflow.com/questions/5510734/install-pear-on-mamp/8178097#8178097
alias mpear='/Applications/MAMP/bin/php/php5.3.14/bin/pear'

# http://alias.sh/my-public-address-ip
alias myip='curl ip.appspot.com'

# http://kvz.io/blog/2012/10/03/quick-server-debugging-with-wtf/
alias wtf='tail -f /var/log/{dmesg,messages,*{,/*}{log,err}}'

# http://alias.sh/cat-syntax-coloration
# alias ccat='pygmentize -O bg=dark'

# # https://tutsplus.com/forums/topic/handy-aliasses-for-opening-sublimetext-with-xiki-buffer/
# # OPEN UP XIKI SUBLIME TEXT 2
# alias stx='subl .;subl *.xiki'
# # Create Xiki buffer from terminal.
# alias xiki='pwd > tree.xiki'

# http://alias.sh/run-multi-site-drush-commands
# alias ms="drush @sites -y"

# http://alias.sh/creating-drupal-sandbox
# alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'

# Compass
alias cw='compass watch'

# Git
alias g='git'
alias ga='git add .'
alias gb='git branch -a'
alias gc='git commit -a -v -m'
alias gd='git diff'
alias gdm='git diff master'
alias go='git checkout'
alias gob='git checkout -b'
alias gom='git checkout master'
alias gm='git merge'
alias glm='git pull origin master'
alias glo='git pull origin'
alias gpm='git push origin master'
alias gpo='git push origin'
alias gs='git status'
# NOTE: `gs` is normally GhostScript.

# TODO
# alias gg='git symbolic-ref --short HEAD | echo $1 cat'
# alias gg='echo ${echo 1}'

# Haskell
alias h='ghc -package-db=.cabal-sandbox/x86_64-osx-ghc-7.6.3-packages.conf.d'
alias hc='cabal'
alias hcs='cabal sandbox'
alias hi='ghci -package-db=.cabal-sandbox/x86_64-osx-ghc-7.6.3-packages.conf.d'
alias hr='runghc -package-db=.cabal-sandbox/x86_64-osx-ghc-7.6.3-packages.conf.d'

# Homebrew
alias b='brew'
alias bd='brew doctor'
alias bi='brew info'
alias bk='brew cask'
alias bkd='brew cask doctor'
alias bki='brew cask info'
alias bkl='brew cask list'
alias bks='brew cask search'
alias bl='brew list'
alias bs='brew search'
alias bu='brew update && brew upgrade && brew cleanup && brew cask cleanup'

# Laravel
alias artisan='php artisan'
alias a='php artisan'

# Vagrant
alias v='cd ~/vagrant-base && vagrant'
alias v3='cd ~/vagrant-base && vagrant up php53'
alias v4='cd ~/vagrant-base && vagrant up php54'
alias v5='cd ~/vagrant-base && vagrant up php55'
alias vh='cd ~/vagrant-base && vagrant halt'
alias vh3='cd ~/vagrant-base && vagrant halt php53'
alias vh4='cd ~/vagrant-base && vagrant halt php54'
alias vh5='cd ~/vagrant-base && vagrant halt php55'
alias vs='cd ~/vagrant-base && vagrant ssh'
alias vs3='cd ~/vagrant-base && vagrant ssh php53'
alias vs4='cd ~/vagrant-base && vagrant ssh php54'
alias vs5='cd ~/vagrant-base && vagrant ssh php55'
alias vu='cd ~/vagrant-base && vagrant up'
alias vu3='cd ~/vagrant-base && vagrant up php53'
alias vu4='cd ~/vagrant-base && vagrant up php54'
alias vu5='cd ~/vagrant-base && vagrant up php55'
