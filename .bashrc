PATH=$PATH:$HOME/.gem/ruby/1.8/bin
export PATH

export EDITOR=vi
export SVN_EDITOR=vi
export GEMEDITOR='mate -w'
export VISUAL=vi

export COPYFILE_DISABLE=true

export RUBY_SOURCE_DIR=$HOME/source/ruby-1.8.7-p72

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

## Terminal
function spchar {
  # chars=("ॐ" "†" "※" "⁂" "℗" "⇨" "∞" "∭" "∴" "⌛" "⌨" "◎" "☀" "☁" "☂" "☃" "☄" "★" "☑" "☒" "☕" "☘" "☛" "☞" "☠" "☪" "☯" "☹" "☺" "♕" "♖" "♗" "♘" "♞" "♠" "♣" "♥" "♦" "♨" "♩" "♪" "♫" "♭" "♯" "♻" "⚀" "⚁" "⚂" "⚃" "⚄" "⚅" "⚐" "⚒" "⚓" "⚔" "⚛" "⚠" "⚡" "✂" "✆" "✈" "✌" "✍" "✏" "✓" "✖" "✗" "✞" "✡" "✪" "✯" "✹" "❀" "❄" "❖" "➔" "➜" "➠" "➢" "➥" "➲" "➾" "")
  chars=("¡" "¿" "ॐ" "†" "※" "⁂" "⁋" "℗" "⇨" "∞" "∭" "∴" "⌛" "⌨" "⍟" "⎋" "◎" "☀" "☁" "☂" "☃" "☄" "★" "☑" "☒" "☕" "☘" "☛" "☞" "☠" "☪" "☫" "☬" "☯" "☸" "☹" "☺" "♕" "♖" "♗" "♘" "♞" "♠" "♣" "♥" "♦" "♨" "♩" "♪" "♫" "♭" "♯" "♻" "⚀" "⚁" "⚂" "⚃" "⚄" "⚅" "⚐" "⚒" "⚓" "⚔" "⚕" "⚚" "⚛" "⚠" "⚡" "✂" "✆" "✈" "✌" "✍" "✏" "✓" "✖" "✗" "✞" "✡" "✪" "✯" "✹" "❀" "❄" "❖" "➔" "➜" "➠" "➢" "➥" "➲" "➾" "")
  RANDOM=$$$(date +%s)
  echo ${chars[$RANDOM % ${#chars[@]}]}
}
# function spchar2 { chars=("☠" "☺" "☀" "☁" "☂" "☃"); RANDOM=$$$(date +%s); echo ${chars[$RANDOM % ${#chars[@]}]}; }

export PS1='\[\e[0;44;93m\]\W\[\e[0m\] \[\e[1;35m\]`date +'%H:%M'` \[\e[1;31m\]`spchar` \[\e[0m\]'
# export PS1='\[\e[0;44;93m\]\W\[\e[0m\] \[\e[1;35m\]`date +'%H:%M'` \[\e[1;31m\] \[\e[0m\]'
# export PS1="\W \u\$ "
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007" ; echo -n $GEM_HOME | sed -e "s/.*\///" | tr -d "\012" ; git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/" | tr -d "\012" ; echo'
#export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007";history -a ; history -n ; echo -n $GEM_HOME | sed -e "s/.*\///" | tr -d "\012" ; git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/" | tr -d "\012" ; echo'
#export PROMPT_COMMAND='echo -n $GEM_HOME | sed -e "s/.*\///" | tr -d "\012" ; git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/" | tr -d "\012" ; echo'
#export PROMPT_COMMAND='echo $GEM_HOME'
# export PROMPT_COMMAND='ruby -v;echo $GEM_HOME'
# export PROMPT_COMMAND='ruby -v'

#case $TERM in
#    xterm*)
#        # PS1="\[\033]0;\u@\h: \w\007\]bash\\$ "
#        # PS1="\[\033[1;37m\]\[\033[41m\][\$(date +%H:%M:%S)][\u@\h \W]# \[\033[0m\]"
#        PS1="\W \u\$ "
#        ;;
#    *)
#        PS1="\W \u\$ "
#        ;;
#esac



rvm use ruby-1.8.7-p330@rails3


## history ( http://d.hatena.ne.jp/sppr/20090109/1231518070 )
# Make bash append rather than overwrite the history on disk
shopt -s histappend
# Whenever displaying the prompt, write the previous line to disk and read unread history lines
#export PROMPT_COMMAND="history -a; history -n"
# increase history size
export HISTSIZE=10000
# Don't put duplicate lines in the history and don't save 
export HISTCONTROL="ignoredups"

# alias rm='rm -i'
alias df='df -h'
alias ll='ls -alt'

alias historyc='history | cut -c8-'
alias historyd='history | cut -c8- | sed -e "s/^/$ /"' 

alias utf='nkf -w --overwrite'

#alias tarc='tar czvf'
#alias tarx='tar zxvf'

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
alias gitst='git status'

alias t='~/Dropbox/Script/createTabAtCurrentDirectory.applescript'
alias grepconf='grep -e "^[^#]"'

alias tl='terminitor list'
alias ts='terminitor start'
alias tst='terminitor start today'

alias vb='vi ~/.bashrc'
alias mb='mate ~/.bashrc'
alias sb='source ~/.bashrc'
alias vbp='vi ~/.bash_profile'
alias mbp='mate ~/.bash_profile'
alias sbp='source ~/.bash_profile'

alias vg='vi ~/.gitconfig'
alias mg='mate ~/.gitconfig'

alias be='bundle exec'
alias brake='bundle exec rake'
alias cap='bundle exec cap'
alias cap_orig='$GEM_HOME/bin/cap'

alias gem137='gem update --system 1.3.7'
alias gemlatest='gem update --system'
alias gemformat="perl -p -i -e 's/ 00:00:00.000000000Z//' ~/.rvm/gems/*/specifications/*.gemspec"

alias rla=request-log-analyzer
# Usage $ cat log/production.log | rl
alias rl='grep Started | awk {'"'"'print $3'"'"'} | sed -e '"'"'s/[0-9][0-9]*/X/g'"'"'| sort | uniq -c | sort -rn'

alias freq='mask_path.rb | sort | uniq -c | sort -n | awk '"'"'$1>1 {print}'"'"''
alias freq2='mask_path.rb | sort | uniq -c | sort -n | awk '"'"'$1>1 {print}'"'"' | awk '"'"'$3 != "" {print}'"'"' | grep -v -P "(cd|git)"'
alias freq3='mask_path.rb | grep "|" | sort | uniq -c | sort -n | awk '"'"'$1>1 {print}'"'"''

alias selenium-server='java -jar /Applications/Selenium/selenium-server-standalone-2.21.0.jar -Dwebdriver.firefox.bin=/Applications/Firefox.app/Contents/MacOS/firefox-bin'
alias iphone='open /Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

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


# alias for AWS
alias ec2-start='ec2-run-instances'
alias ec2-stop='ec2-terminate-instances'
alias ec2-status='ec2-describe-instances'
alias ec2-auth='ec2-authorize default -p 22 && ec2-authorize default -p 80'



# Memo
# Restart Finder
# osascript -e 'tell app "Finder" to quit'



PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
