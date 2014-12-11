alias cp='cp -i'
alias cl='clear'
alias li='ls -lAG'

# https://github.com/yrammos/dotfiles/blob/master/.bashrc
alias .=pwd
alias mv='mv -i'

# http://www.techrepublic.com/blog/10things/cut-down-on-linux-command-line-typing-with-these-10-handy-bash-aliases/352
alias rm='rm -i'
alias df='df -h'

# Drush
alias dr='drush'
alias drc='drush cc all'
alias drd='drush dis'
alias dre='drush en'
alias drf='drush fra -y'
alias drfu='drush fra -y; drush updb -y'
alias drl='drush uli'
alias dru='drush updb -y'

# Git
alias g='git'
alias ga='git add .'
alias gc='git commit -v -m'
alias gm='git merge'
alias glo='git pull origin'
alias gpo='git push origin'

# Haskell
alias ca='cabal'
alias cas='cabal sandbox'
alias hs='ghc -package-db=.cabal-sandbox/x86_64-osx-ghc-7.6.3-packages.conf.d'
alias hsi='ghci -package-db=.cabal-sandbox/x86_64-osx-ghc-7.6.3-packages.conf.d'
alias runhs='runghc -package-db=.cabal-sandbox/x86_64-osx-ghc-7.6.3-packages.conf.d'

# Homebrew
alias b='brew'
alias bl='brew list'
alias bu='brew update; brew upgrade; brew cleanup'

# Laravel
alias artisan='php artisan'
alias a='php artisan'

# http://alias.sh/cat-syntax-coloration
# alias ccat='pygmentize -O bg=dark'

# http://alias.sh/run-multi-site-drush-commands
# alias ms="drush @sites -y"

# http://alias.sh/creating-drupal-sandbox
# alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'

# http://stackoverflow.com/questions/5510734/install-pear-on-mamp/8178097#8178097
alias mpear='/Applications/MAMP/bin/php/php5.3.14/bin/pear'

# http://alias.sh/my-public-address-ip
alias myip='curl ip.appspot.com'

# http://alias.sh/greet-new-project
# alias sup='npm install'

# # https://tutsplus.com/forums/topic/handy-aliasses-for-opening-sublimetext-with-xiki-buffer/
# # OPEN UP XIKI SUBLIME TEXT 2
# alias stx='subl .;subl *.xiki'
# # Create Xiki buffer from terminal.
# alias xiki='pwd > tree.xiki'

# http://kvz.io/blog/2012/10/03/quick-server-debugging-with-wtf/
alias wtf='tail -f /var/log/{dmesg,messages,*{,/*}{log,err}}'
