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
  export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007" ; echo -n $GEM_HOME | sed -e "s/.*\///" | tr -d "\012" ; git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ \1 /" | tr -d "\012" ; git rev-parse --short HEAD 2> /dev/null | tr -d "\012" ; echo'
fi

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi


# reverse search http://superuser.com/questions/159106/reverse-i-search-in-bash
stty -ixon

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
export HISTSIZE=100000
export SAVEHIST=100000
# Don't put duplicate lines in the history and don't save
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT="%F %T "

# alias rm='rm -i'
alias df='df -h'

alias sl=ls
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -althr'     # 'ls -al'
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

alias utf='nkf -wd --overwrite'
alias utfhalf='nkf -xwd --overwrite'
alias utfall='find . -type f -name "*" -exec nkf -wd --overwrite {} \;'
alias sjis='nkf -s --overwrite'
alias multibyte='git ls-files | xargs nkf -g | grep -v -P "(ASCII|BINARY)" | grep -P "\.rb"'
#alias tarc='tar czvf'
#alias tarx='tar zxvf'

alias rspecf='rspec --only-failures'
alias rspecdc='rspec --format documentation'
alias rbp='rails_best_practices -f html . ; open rails_best_practices_output.html'
alias db_migrate='bundle exec rake db:migrate ; RAILS_ENV=test bundle exec rake db:migrate'
alias db_rollback='bundle exec rake db:rollback ; RAILS_ENV=test bundle exec rake db:rollback'
alias db_drop='bundle exec rake db:drop ; RAILS_ENV=test bundle exec rake db:drop'
alias testdb_reset='RAILS_ENV=test bundle exec rake db:drop ; RAILS_ENV=test bundle exec rake db:migrate'

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
alias greprl='ggrep -rl'
alias greprx='ggrep --exclude-dir=tmp --exclude-dir=log -r'
alias grepc='LANG=C ggrep'

function mmgrep() {
  # Refs:
  # https://stackoverflow.com/questions/5929492/bash-script-to-convert-from-html-entities-to-characters
  # http://d.hatena.ne.jp/BigFatCat/20080120/1200825243
  # https://stackoverflow.com/questions/15065010/how-do-i-use-a-for-each-loop-to-iterate-over-file-paths-output-by-the-find-utili
  if [[ -n "$1" ]];then
    find . -type f -iname "*.mm" -print0 | while IFS= read -r -d $'\0' line; do
      result=$(cat "$line" | perl -MHTML::Entities -pe 'binmode(STDOUT, ":utf8"); decode_entities($_);' | grep $1)
      if [ -n "$result" ]; then
        echo $line
        echo $result
        echo ''
      fi
    done
  else
    echo "Grep mindmap documents which includes HTML entities"
    echo "Usage: $ mmgrep word"
  fi
}

alias pjson='python -mjson.tool'

alias s='subl -w'
alias s2='subl2 -w'
alias sublc2='cd ~/Library/Application\ Support/Sublime\ Text\ 2/'
alias sublc='cd ~/Library/Application\ Support/Sublime\ Text\ 3/'
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

alias bapi_on='ruby -i -pe "gsub %r{^(source.*)https?://rubygems\.org(.*)}, '\''\1http://bundler-api.herokuapp.com/\2'\''" Gemfile'
alias bapi_off='ruby -i -pe "gsub %r{^(source.*)http://bundler-api\.herokuapp\.com/(.*)}, '\''\1https://rubygems.org\2'\''" Gemfile'

alias cap='bundle exec cap'
alias cap_orig='$GEM_HOME/bin/cap'

alias gem137='gem update --system 1.3.7'
alias gemlatest='gem update --system'
alias gemformat="perl -p -i -e 's/ 00:00:00.000000000Z//' ~/.rvm/gems/*/specifications/*.gemspec"
alias gemlistall='gem list --all --remote'

alias st='git sourcetree'

alias rbed='ruby-build --definitions'
alias rbeu='brew uninstall ruby-build && brew install --HEAD ruby-build'
alias rbev='rbenv versions'
alias rbei='rbenv install'
alias rber='rbenv rehash'
alias rbeg='rbenv global'
alias rbel='rbenv local'

alias rla=request-log-analyzer

function pps() {
  if [[ -z "$@" ]];then
    papertrail -f -g staging staging.log | perl -pe 's/^(.{15})(.)([\S]+)(.)([\S]+)/\e[1;35m\1\e[0m\2\e[1;33m\3\e[0m\4\e[0;36m\5\e[0m/g';
  else
    papertrail -f -g staging staging.log $@ | perl -pe 's/^(.{15})(.)([\S]+)(.)([\S]+)/\e[1;35m\1\e[0m\2\e[1;33m\3\e[0m\4\e[0;36m\5\e[0m/g' | perl -pe "s/($@)(.*)/\e[1;31m\1\e[0m\2/g";
  fi
}
function ppe() {
  papertrail -f -g $1 staging.log $2 | perl -pe 's/^(.{15})(.)([\S]+)(.)([\S]+)/\e[1;35m\1\e[0m\2\e[1;33m\3\e[0m\4\e[0;36m\5\e[0m/g' | perl -pe "s/($@)(.*)/\e[1;31m\1\e[0m\2/g";
}
function ppp() {
  if [[ -z "$@" ]];then
    papertrail -f -g production production.log | perl -pe 's/^(.{15})(.)([\S]+)(.)([\S]+)/\e[1;35m\1\e[0m\2\e[1;33m\3\e[0m\4\e[0;36m\5\e[0m/g';
  else
    papertrail -f -g production production.log $@ | perl -pe 's/^(.{15})(.)([\S]+)(.)([\S]+)/\e[1;35m\1\e[0m\2\e[1;33m\3\e[0m\4\e[0;36m\5\e[0m/g' | perl -pe "s/($@)(.*)/\e[1;31m\1\e[0m\2/g";
  fi
}
function ppt() {
  if [[ -z "$@" ]];then
    echo "No \$@";
    echo $@;
  else
    echo $@;
  fi
}


# Usage $ cat log/production.log | rl
alias rl='grep Started | awk {'"'"'print $3'"'"'} | sed -e '"'"'s/[0-9][0-9]*/X/g'"'"'| sort | uniq -c | sort -rn'

alias freq='mask_path.rb | sort | uniq -c | sort -n | awk '"'"'$1>1 {print}'"'"''
alias freq2='mask_path.rb | sort | uniq -c | sort -n | awk '"'"'$1>1 {print}'"'"' | awk '"'"'$3 != "" {print}'"'"' | grep -v -P "(cd|git)"'
alias freq3='mask_path.rb | grep "|" | sort | uniq -c | sort -n | awk '"'"'$1>1 {print}'"'"''

alias redis-server-with-conf='redis-server /usr/local/etc/redis.conf'
alias selenium-server='java -jar /Applications/Selenium/selenium-server-standalone-2.21.0.jar -Dwebdriver.firefox.bin=/Applications/Firefox.app/Contents/MacOS/firefox-bin'
alias iphone='open /Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'
alias sim='open ~/Library/Application\ Support/iPhone\ Simulator/6.1/Applications/'

alias pgs='/usr/local/bin/postgres -D /usr/local/var/postgres'

function brewfix {
  brew unlink $@ && brew link $@
}

function pg_dup {
  if [[ -n "$2" ]];then
    createdb -U $USER -O $USER -T $1 $2
  else
    echo "Copy database with given database name"
    echo "Usage: $ pg_dup copy_from copy_to"
  fi
}
function pg_force {
  if [[ -n "$2" ]];then
    dropdb --if-exists $2
    createdb -U $USER -O $USER -T $1 $2
  else
    echo "Copy database with given database name. Drop the target database when it exists"
    echo "Usage: $ pg_force copy_from replace_with"
  fi
}
function pg_copy {
  if [[ -n "$1" ]];then
    local branch=$(git rev-parse --abbrev-ref HEAD)
    local rev=$(git rev-parse --short HEAD)
    echo "Creating $1-$branch-$rev"
    createdb -U $USER -O $USER -T $1 $1-$branch-$rev
  else
    echo "Copy database with suffix of branch and revision"
    echo "Usage: $ pg_copy copy_from"
  fi
}
function pg_prev_copy {
  if [[ -n "$1" ]];then
    local branch=$(git rev-parse --abbrev-ref @{-1})
    local rev=$(git rev-parse --short @{-1})
    echo "Creating $1-$branch-$rev"
    createdb -U $USER -O $USER -T $1 $1-$branch-$rev
  else
    echo "Copy database with suffix of previous branch and revision"
    echo "Usage: $ pg_prev_copy copy_from"
  fi
}

function sshweb {
  # ssh first pod in given namespace
  if (( "$#" != 1 ))
  then
    echo "[Error] Give namespace to ${FUNCNAME[ 0 ]}"
  else
    ## TODO kubectl get pod --namespace xxx -l component=rails,role=web
    local name=$(kubectl get pods --namespace=$@ | egrep '(migrate)' | grep Running | head -n1 | awk '{print $1}')
    kubectl exec -ti $name --namespace=$@ bash
  fi
}

function sshweb_old {
  # ssh first pod in given namespace
  if (( "$#" != 1 ))
  then
    echo "[Error] Give namespace to ${FUNCNAME[ 0 ]}"
  else
    ## TODO kubectl get pod --namespace xxx -l component=rails,role=web
    local name=$(kubectl get pods --namespace=$@ | egrep '(migrate|web|rails|puma)' | grep Running | head -n1 | awk '{print $1}')
    kubectl exec -ti $name --namespace=$@ bash
  fi
}

function kubehistory {
  kubectl get pods -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{"\t"}{.metadata.creationTimestamp}{"\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' |sort
}

## http://hayne.net/MacDev/Bash/aliases.bash
#-----------
# Searching:
#-----------

# Searching bundle gems http://www.saturnflyer.com/blog/jim/2013/03/15/searching-through-your-bundled-gems
# Usage : $ agb textarea $ agb "form textarea"
agb () {
  ag "$@" `bundle show --paths`
}

run() {
  number=$1
  shift
  for i in `seq $number`; do
    $@
  done
}

# ff:  to find a file under the current directory
ff () { /usr/bin/find . -name "$@" ; }
# ffs: to find a file whose name starts with a given string
ffs () { /usr/bin/find . -name "$@"'*' ; }
# ffe: to find a file whose name ends with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }

clear_git () {
  find . | grep -p ".git$" | xargs rm -rf
}

rm_node_modules () {
  if [[ $1 = '-f' ]];then
    # https://qiita.com/yuta0801/items/118d9478ad536a443f3f
    find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +
  else
    find . -name 'node_modules' -type d
    echo "Run '$ rm_node_modules -f' to remove all"
  fi
}

# grepfind: to grep through files found by find, e.g. grepf pattern '*.c'
# note that 'grep -r pattern dir_name' is an alternative if want all files
grepfind () { find . -type f -name "$2" -print0 | xargs -0 grep "$1" ; }
# I often can't recall what I named this alias, so make it work either way:
alias findgrep='grepfind'

# find_larger: find files larger than a certain size (in bytes)
find_larger() { find . -type f -size +${1}c ; }

function sublg { bundle show $@ | xargs subl; }

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then PATH=$PATH:$HOME/.rvm/bin ; fi # Add RVM to PATH for scripting

export PATH=$PATH:~/bin

export GOPATH=$HOME/go
