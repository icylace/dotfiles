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

# Compass
alias cw='compass watch'

# Git
alias g='git'
alias ga='git add .'
# alias ga='git add --all'
# alias gau='git add -u'
alias gb='git branch -a'
alias gc='git commit -v -m'
alias gsr='git symbolic-ref --short HEAD'
# alias gcb='git commit -a -v -m ...... $(gsr)'
alias gd='git diff HEAD --minimal'
alias gds='git diff HEAD --minimal --staged'
alias gdsw='git diff HEAD --minimal --staged --word-diff'
alias gdw='git diff HEAD --minimal --word-diff'
# Based on:
# https://drupalize.me/videos/moving-through-git-history?p=1173
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias gll='git log --decorate --graph --all'
# alias gll='git log --decorate --graph --all --oneline'
alias glo='git pull origin'
alias gm='git merge'
alias go='git checkout'
alias gob='git checkout -b'
# alias gp='git push origin $(gsr)'
alias gpo='git push origin'
alias gr='git reset --hard; git clean -fd'
# alias gs='git status --untracked-files'
alias gs='git status --untracked-files --short'
# NOTE: `gs` is normally GhostScript.
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
alias s='swift'
# c() {
#   if [ -f "$1" ]; then
#     cat $@
#   else
#     if [ -n "$1" ]; then
#       cd $@
#       ls -AGp
#     else
#       ls -AGp
#     fi
#   fi
# }

# Symfony
alias sr='php app/console server:run'

# Vagrant
alias v='cd ~/My/Repositories/vagrant-base && vagrant'
alias vh='v halt'
alias vh3='v halt php53'
alias vh4='v halt php54'
alias vh5='v halt php55'
alias vp3='v provision php53'
alias vp4='v provision php54'
alias vp5='v provision php55'
alias vs='v status'
alias vs3='v ssh php53'
alias vs4='v ssh php54'
alias vs5='v ssh php55'
alias vu='v up'
alias vu3='v up php53'
alias vu4='v up php54'
alias vu5='v up php55'
alias v3='vu3; vs3'
alias v4='vu4; vs4'
alias v5='vu5; vs5'

# http://stackoverflow.com/a/28054871
alias b2d='boot2docker start; $(boot2docker shellinit)'
