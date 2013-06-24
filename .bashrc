#export PATH=/usr/local/Cellar/libxml2/2.7.8/bin/:/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=/usr/local/Cellar/libxml2/2.7.8/bin:/usr/local/bin:/usr/local/sbin:${PATH}
export TERM="xterm";
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export PATH="${PATH}:/Applications/android-sdk-mac_x86/tools:."



#export PS1="\e[37m\u@\h \e[36m[\$(date +%m-%d\" \"%H:%M)] \e[31m<\W> \e[33m\$ \e[0m"
########old-working#####export PS1="\e[37m\u@\h \e[36m[\$(date +%m-%d\" \"%H:%M)] \e[31m<\W> \e[33m \e[0m\n> "
#export PS1="\e[37m\u@\h \e[36m[\$(date +%m-%d\" \"%H:%M)] \e[31m<\W> \e[33m \n> "
#export PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '
#export PS1="\e[37m\u@\h \e[36m[\$(date +%m-%d\" \"%H:%M)] \e[31m<\W> \e[33m \e[0m  \W$(__git_ps1 "(%s)") \u\$ \n> "
#export PS1="\e[37m\u@\h \e[36m[\$(date +%m-%d\" \"%H:%M)] \e[31m<\W> \e[33m \e[0m\n> "

alias rms='rvmsudo moov server -auto-hosts=true .'
alias mate2='open -a /Applications/TextMate2.app/Contents/MacOS/TextMate'
alias work='cd ~/workspace'
alias catman='cat MANHATTAN_VERSION'
alias android_dir='cd /Developer/android-sdk-macosx'
#alias renamespritestoretina='ls *.png | awk '{ print "mv " $1 " " $1 }' | sed "s/\.png/@2x\.png/2" | /bin/sh'

android() {
  if [ 0 -eq $# ]; then
    android_dir
  elif [ 1 -eq $# ]; then
    /Developer/android-sdk-macosx/tools/emulator -avd Android$1 -no-snapshot-load -partition-size 256
  fi
}

mhonie() {
  if [ 1 -eq $# ]; then
    rvmsudo moov server --asset-host=http://mhonie.$1.com:3003
  fi
}

gemset () {
  if [ 0 -eq $# ]; then
    rvm gemset name
  elif [ 1 -eq $# ]; then
    rvm gemset use "$@" ;
  fi
}

__git_repo () {
  local g="$(__gitdir)"
  local repo_dir=""

  if [ -n "$g" ]; then
    if [ ! ".git" == "$g" ]; then
      git_dir=`dirname $g`
      repo_dir=`basename $git_dir`
	  printf " $repo_dir"
    fi
  fi
}

export GIT_PS1_SHOWDIRTYSTATE=1
#export PS1='[\[\033[0;31m\]\u@\h\[\033[0m\]\[\033[0;36	m\]$(__git_repo) \[\033[0;34m\]\W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\033[0m\]]\$ '
#working->export PS1='\[\033[0;31m\]\u@\h\[\033[0m\]\[\033[0;36  \]$(__git_repo) \[\033[0;34m\] <\W>\[\033[0;35m\]$(__git_ps1 " (%s)")\[\033[0m\] \n> '
#working2->export PS1='\[\033[0;37m\]\u@\h\[\033[0m\]\[\033[0;36  \]$(__git_repo) \[\033[0;31m\] <\W>\[\033[0;36m\]$(__git_ps1 " (%s)")\[\033[0m\] \n> '

White='\e[0;37m'
Red='\e[0;31m'
Blue='\e[0;36m'
DefaultColor='\e[0m'

export PS1=${White}'\u@\h$(__git_repo)'${Red}' <\W>'${Blue}'$(__git_ps1 " (%s)")'${DefaultColor}' \n> '
#export PS1='\[\033[0;37m\]\u@\h\[\033[0m\]\[\033[0;36  \]$(__git_repo) \[\033[0;31m\] <\W>\[\033[0;36m\]$(__git_ps1 " (%s)")\[\033[0m\] \n> '

sprunge() { printf "%s%s\n" "$(curl -sF 'sprunge=<-' http://sprunge.us/)" "${*:+?$*}"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
