### For .bash_profile
# if [ -f ~/.bashrc ] ; then
# . ~/.bashrc
# fi
######

# .bashrc

if [[ $OSTYPE == darwin* ]] ; then
  PATH=$PATH:$HOME/.gem/ruby/1.8/bin
  export PATH

  export EDITOR=vi
  export SVN_EDITOR=vi
  export GEMEDITOR='subl -w'
  export VISUAL='subl -w'

  export COPYFILE_DISABLE=true

  ## Terminal
  if [ -f $HOME/.special_characters ]; then
    source $HOME/.special_characters
  else
    function spchar {
      echo "$"
    }
  fi

  export PS1='\[\e[0;44;93m\]\W\[\e[0m\] \[\e[1;35m\]`date +'%H:%M'` \[\e[1;31m\]`spchar` \[\e[0m\]'
  # export PS1="\W \u\$ "
else
  # Source global definitions
  if [ -f /etc/bashrc ]; then
         . /etc/bashrc
  fi

  # User specific aliases and functions

  # User command aliases
  alias useradd='sudo useradd'
  alias usermod='sudo usermod'
  alias userdel='sudo userdel'

  # Other aliases
  alias apachectl='sudo apachectl'
  alias chkconfig='sudo chkconfig'
  alias gpasswd='sudo gpasswd'
  alias service='sudo service'
  alias reboot='sudo reboot'
  alias yum='sudo yum'
fi

if [[ -s $HOME/.rbenv ]] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if which rbenv &>/dev/null; then
  export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007" ; echo $(rbenv version-name) | tr -d "\012" ; git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/" | tr -d "\012" ; echo'
else
  export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007" ; echo -n $GEM_HOME | sed -e "s/.*\///" | tr -d "\012" ; git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/" | tr -d "\012" ; echo'
fi

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi


# colored grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

## history ( http://d.hatena.ne.jp/sppr/20090109/1231518070 )
# Make bash append rather than overwrite the history on disk
shopt -s histappend
# Whenever displaying the prompt, write the previous line to disk and read unread history lines
#export PROMPT_COMMAND="history -a; history -n"
# increase history size
export HISTSIZE=10000
# Don't put duplicate lines in the history and don't save
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT="%F %T "

# alias rm='rm -i'
alias df='df -h'

alias sl=ls
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -alth'     # 'ls -al'
alias l='ls -a'
alias l1='ls -1'

alias q="exit"

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up two directories
alias -- -="cd -"        # Go back

alias stop='top -o CPU -s 5'

alias h='ghci'

alias hi='history'
alias historyc='history | cut -c8-'
alias historyd='history | cut -c8- | sed -e "s/^/$ /"'

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

alias utf='nkf -w --overwrite'
alias utfall='find . -type f -name "*" -exec nkf -w --overwrite {} \;'
alias sjis='nkf -s --overwrite'
alias multibyte='git ls-files | xargs nkf -g | grep -v -P "(ASCII|BINARY)" | grep -P "\.rb"'
#alias tarc='tar czvf'
#alias tarx='tar zxvf'

alias rspeci='rspec spec/integration'
alias rspecj='rspec --tag js'
alias rspecf='rspec --tag ~js'
alias rbp='rails_best_practices'
alias db_migrate='bundle exec rake db:migrate ; RAILS_ENV=test bundle exec rake db:migrate'
alias db_rollback='bundle exec rake db:rollback ; RAILS_ENV=test bundle exec rake db:rollback'
alias db_drop='bundle exec rake db:drop ; RAILS_ENV=test bundle exec rake db:drop'
alias testdb_reset='RAILS_ENV=test bundle exec rake db:drop ; RAILS_ENV=test bundle exec rake db:migrate'

alias cdc='cd ~/current'
alias rvmc='rvm use ruby-1.8.7-p330@rails3'
alias rvms='rvm use system'
alias drvmc='rvm --default use ruby-1.8.7-p330@rails3'
alias drvms='rvm --default use system'
alias m=mate

alias g='git'
alias gut=git
alias got=git
alias gti=git
alias gst='git status'
alias gitst='git status'
alias gs='git status'
alias gpod='git pull --rebase origin develop'
alias gpom='git pull --rebase origin master'

alias grepconf='grep -e "^[^#]"'
# grep -rl "string" /path (recursive & files-with-matches)
alias greprl='grep -rl'

alias cl='consular list'
alias ce='consular edit'
alias cs='consular start'
alias cc='consular create'
alias cst='consular start today'
alias tst='consular start today'

alias s=subl
alias sublc='cd ~/Library/Application\ Support/Sublime\ Text\ 2/'
alias vb='vi ~/.bashrc'
alias mb='subl ~/.bashrc'
alias sb='source ~/.bashrc'
alias vbp='vi ~/.bash_profile'
alias mbp='subl ~/.bash_profile'
alias sbp='source ~/.bash_profile'

alias vg='vi ~/.gitconfig'
alias mg='subl ~/.gitconfig'

alias be='bundle exec'
alias brake='bundle exec rake'
alias beat='bundle exec autotest'
alias beats='SELENIUM=true bundle exec autotest'

alias bl='mv $HOME/.bundle_OFF $HOME/.bundle'
alias bloff='mv $HOME/.bundle $HOME/.bundle_OFF'
alias cap='bundle exec cap'
alias cap_orig='$GEM_HOME/bin/cap'

alias gem137='gem update --system 1.3.7'
alias gemlatest='gem update --system'
alias gemformat="perl -p -i -e 's/ 00:00:00.000000000Z//' ~/.rvm/gems/*/specifications/*.gemspec"

alias st='git sourcetree'

alias rbed='ruby-build --definitions'
alias rbev='rbenv versions'
alias rbei='rbenv install'
alias rber='rbenv rehash'
alias rbeg='rbenv global'
alias rbel='rbenv local'

alias rla=request-log-analyzer
# Usage $ cat log/production.log | rl
alias rl='grep Started | awk {'"'"'print $3'"'"'} | sed -e '"'"'s/[0-9][0-9]*/X/g'"'"'| sort | uniq -c | sort -rn'

alias freq='mask_path.rb | sort | uniq -c | sort -n | awk '"'"'$1>1 {print}'"'"''
alias freq2='mask_path.rb | sort | uniq -c | sort -n | awk '"'"'$1>1 {print}'"'"' | awk '"'"'$3 != "" {print}'"'"' | grep -v -P "(cd|git)"'
alias freq3='mask_path.rb | grep "|" | sort | uniq -c | sort -n | awk '"'"'$1>1 {print}'"'"''

alias redis-server-with-conf='redis-server /usr/local/etc/redis.conf'
alias selenium-server='java -jar /Applications/Selenium/selenium-server-standalone-2.21.0.jar -Dwebdriver.firefox.bin=/Applications/Firefox.app/Contents/MacOS/firefox-bin'
alias iphone='open /Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

alias pgs='/usr/local/bin/postgres -D /usr/local/var/postgres'


function eysshs {
  echo "Usage: $ eysshs 'ls /path/to/'"
  ey ssh "echo \"### \`hostname\` ###\";$@" -e staging --all
}
function eysshproduction {
  echo "Usage: $ eysshproduction 'ls /path/to/'"
  ey ssh "echo \"### \`hostname\` ###\";$@" -e production --all
}


# Common Rails command shortcuts
# http://blog.envylabs.com/2010/07/common-rails-command-shortcuts/
function ss {
  if [ -e script/rails ]; then
    script/rails server $@
  else
    script/server $@
  fi
}
function sc {
  if [ -e script/rails ]; then
    script/rails console $@
  else
    script/console $@
  fi
}
function sg {
  if [ -e script/rails ]; then
    script/rails generate $@
  else
    script/generate $@
  fi
}


## http://hayne.net/MacDev/Bash/aliases.bash
#-----------
# Searching:
#-----------
# ff:  to find a file under the current directory
ff () { /usr/bin/find . -name "$@" ; }
# ffs: to find a file whose name starts with a given string
ffs () { /usr/bin/find . -name "$@"'*' ; }
# ffe: to find a file whose name ends with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }

# grepfind: to grep through files found by find, e.g. grepf pattern '*.c'
# note that 'grep -r pattern dir_name' is an alternative if want all files
grepfind () { find . -type f -name "$2" -print0 | xargs -0 grep "$1" ; }
# I often can't recall what I named this alias, so make it work either way:
alias findgrep='grepfind'

# find_larger: find files larger than a certain size (in bytes)
find_larger() { find . -type f -size +${1}c ; }

function sublg { bundle show $@ | xargs subl; }

# alias for AWS
alias ec2-start='ec2-run-instances'
alias ec2-stop='ec2-terminate-instances'
alias ec2-status='ec2-describe-instances'
alias ec2-auth='ec2-authorize default -p 22 && ec2-authorize default -p 80'



# Memo
# Restart Finder
# osascript -e 'tell app "Finder" to quit'


if [[ -s $HOME/.rvm/scripts/rvm ]] ; then PATH=$PATH:$HOME/.rvm/bin ; fi # Add RVM to PATH for scripting

export PATH=$PATH:~/bin
