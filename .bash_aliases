alias cp='cp -i'
alias li='ls -lAG'

#
# Pipes in/out of the clipboard.
#
# Usage: someapp | cb     # Pipe someapp's output into clipboard
#        cb | someapp     # Pipe clipboard's content into someapp
#
# http://stackoverflow.com/a/19458217
#
cb() {
  if [[ -p /dev/stdin ]]; then
    # stdin is a pipe.
    # stdin -> clipboard
    pbcopy
  else
    # stdin is not a pipe.
    # clipboard -> stdout
    pbpaste
  fi
}

# Preview the OS X clipboard in the terminal.
# http://brettterpstra.com/2014/12/11/preview-the-os-x-clipboard-in-terminal/
alias cbp='pbpaste | less'

# https://github.com/yrammos/dotfiles/blob/master/.bashrc
alias .='pwd'
alias mv='mv -i'

# http://www.techrepublic.com/blog/10things/cut-down-on-linux-command-line-typing-with-these-10-handy-bash-aliases/352
alias df='df -h'

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md#safeguard-rm
alias rm='rm -i'

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

# http://stackoverflow.com/a/28054871
alias b2d='boot2docker start; $(boot2docker shellinit)'

# Compass
alias cw='compass watch'

# Git
alias g='git status --untracked-files --short'
alias ga='git add .'
# alias gaa='git add --all'
alias gb='git branch --all'
alias gc='git commit --verbose -m'
alias gsr='git symbolic-ref --short HEAD'
# alias gcb='git commit -a -v -m ...... $(gsr)'
alias gd='git diff HEAD --minimal'
alias gds='git diff HEAD --minimal --staged'
alias gdsw='git diff HEAD --minimal --staged --word-diff'
alias gdw='git diff HEAD --minimal --word-diff'
# Based on:
# https://drupalize.me/videos/moving-through-git-history?p=1173
alias gl='git log --abbrev-commit --date=relative --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias gll='git log --decorate --graph --all'
# alias gllo='git log --decorate --graph --all --oneline'
alias glo='git pull origin'
alias gm='git merge'
alias go='git checkout'
alias gob='git checkout -b'
# alias gp='git push origin $(gsr)'
alias gpo='git push origin'
alias gr='git reset --hard; git clean --force -d'
# Note: `gs` is also for Ghostscript.
alias gs='git status --untracked-files'
alias gu='git add --update'
alias gy='git apply --verbose'

# TODO
# alias gg='git symbolic-ref --short HEAD | echo $1 cat'
# alias gg='echo ${echo 1}'
# alias gg='echo ${git symbolic-ref --short HEAD}'

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
alias bl='brew list'
alias bs='brew search'
alias bu='brew update && brew upgrade --all && brew cleanup && brew cask cleanup'

# Homebrew Cask
alias bk='brew cask'
alias bkd='brew cask doctor'
alias bki='brew cask info'
alias bkl='brew cask list'
alias bks='brew cask search'
# alias bku='brew cask update'

# Laravel
alias artisan='php artisan'
alias a='php artisan'

# Swift
s() {
  if [ -n "$1" ]; then
    if [ -f "$1" ]; then
      swift "$1.swift"
    fi
  else
    swift *.swift
  fi
}

# Symfony
alias sr='php app/console server:run'

# Vagrant
alias v='vagrant status'
alias vbl='vagrant box list'
alias vbr='vagrant box remove'
alias vd='vagrant destroy'
alias vg='vagrant global-status --prune'
alias vh='vagrant halt'
alias vp='vagrant provision'
alias vs='vagrant ssh'
alias vu='vagrant up'
# PHP 5.5 box.
alias vbase='cd ~/My/Repositories/vagrant-base'
# PHP 5.3 box.
alias vh3='vbase && vagrant halt php53'
alias vp3='vbase && vagrant provision php53'
alias vs3='vbase && vagrant ssh php53'
alias vu3='vbase && vagrant up php53'
alias v3='vu3; vs3'
# PHP 5.4 box.
alias vh4='vbase && vagrant halt php54'
alias vp4='vbase && vagrant provision php54'
alias vs4='vbase && vagrant ssh php54'
alias vu4='vbase && vagrant up php54'
alias v4='vu4; vs4'
# PHP 5.5 box.
alias vh5='vbase && vagrant halt php55'
alias vp5='vbase && vagrant provision php55'
alias vs5='vbase && vagrant ssh php55'
alias vu5='vbase && vagrant up php55'
alias v5='vu5; vs5'

# yadm
# https://github.com/TheLocehiliosan/yadm
alias y='yadm status --untracked-files=no'
alias ya='yadm add'
alias yc='yadm commit -m'
alias yd='yadm diff HEAD --minimal'
alias yu='yadm add --update'
# Based on:
# https://drupalize.me/videos/moving-through-git-history?p=1173
alias yl='yadm log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias ylm='yadm pull origin master'
alias ypm='yadm push --set-upstream origin master'
