# .bashrc file
#
# Concepts:
#
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#    2) .bash_profile is the *login* config for bash, launched upon first connection.
#    3) .bash_profile imports .bashrc, but not vice versa.
#    4) .bashrc imports .bashrc_custom, which can be used to override
#        variables specified here.
#
# When Bash starts, it executes the commands in a variety of different scripts.
#
#   1) When Bash is invoked as an interactive login shell, it first reads
#      and executes commands from the file /etc/profile, if that file
#      exists. After reading that file, it looks for ~/.bash_profile,
#      ~/.bash_login, and ~/.profile, in that order, and reads and executes
#      commands from the first one that exists and is readable.
#
#   2) When a login shell exits, Bash reads and executes commands from the
#      file ~/.bash_logout, if it exists.
#
#   3) When an interactive shell that is not a login shell is started
#      (e.g. a GNU screen session), Bash reads and executes commands from
#      ~/.bashrc, if that file exists. This may be inhibited by using the
#      --norc option. The --rcfile file option will force Bash to read and
#      execute commands from file instead of ~/.bashrc.

## -----------------------
## -- 2) Set up aliases --
## -----------------------

# 2.0) From Alias.sh

# CLI -improved (https://remysharp.com/2018/08/23/cli-improved)
alias cat='bat'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'

#Extract most know archives with one command
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#Jump back n directories at a time
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# Show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

# Search for process
alias tm='ps -ef | grep'

# List all folders
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones

# Show hidden files only
alias l.='ls -d .* --color=auto'

# Copy public key to remote machine (dependency-less)
function authme() {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
    < ~/.ssh/id_dsa.pub
}

# What's gobbling the memory?
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'

# Pretty print json
function ppjson () {
    if [ "${1}" ]; then cat "${1}" | python -mjson.tool; fi
}

# 2.1) Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# 2.2) Listing, directories, and motion
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export GREP_OPTIONS='--color=auto'
alias ll="ls -alrtF"
alias la="ls -A"
alias l="ls -CF"
alias lld="ls -ld */"
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias m='less'
alias md='mkdir'
alias c='clear'
#alias du='du -ch --max-depth=1'
alias treeacl='tree -A -C -L 2'

# 2.3) Text and editor commands
export EDITOR='vim'
export VISUAL='vim'

# 2.4) grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31' # green for matches

# 2.5) sort options
# Ensures cross-platform sorting behavior of GNU sort.
# http://www.gnu.org/software/coreutils/faq/coreutils-faq.html#Sort-does-not-sort-in-normal-order_0021
#unset LANG
#export LC_ALL=POSIX

# 2.6) Git options

alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias recap='git log --all --oneline --no-merges --author=devan.rehunathan@sky.uk'
alias gwho='git shortlog -s -n'

# Compact, colorized git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Visualise git log (like gitk, in the terminal)
alias gg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

## ------------------------------
## -- 3) User-customized code  --
## ------------------------------

# Set vi mode as default
set -o vi

# Automatic tab naming for iTerm tabs
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}\007"'

# Matrix Terminal
alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'

# Javascript development on MAC
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'

# HomeBrew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

alias bmsprod='pgcli -h 10.246.40.105 -U bmsadmin -d metro'

alias bmsqa='pgcli -h cpbmsqa01.sns.sky.com -U bmsadmin -d metro'

# set search_path to bms, cdn, forecast, inventory, mon, nis, nis_master, peering, public, public_views, rsrm, service, util;
alias coreprod='pgcli -h  iapprd01.sns.sky.com -U nsa_bms -d core'

alias coreqa='pgcli -h  iapqa01.sns.sky.com -U core_user -d core'

alias hubprod='pgcli -h insightandplanning.sns.sky.com -U hub -d hub'

alias hubqa='pgcli -h insightandplanning-qa.sns.sky.com -U hub_qa -d hub_qa'

# tmux prompt bug fix
alias tmux='tmux -u'

# Jupyter Notebook
alias notes='jupyter notebook'

# Brew Update and Upgrade
alias brewup='brew update && brew outdated --verbose && brew upgrade && brew cleanup -ns && brew cleanup'

# Jenkins
alias start_jenkins='sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist'
alias stop_jenkins='sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist'

# Kill process
alias skill='sudo kill -9'

# Add timestamps to history
export HISTTIMEFORMAT="%d/%m/%y %T "

