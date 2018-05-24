### -----------------------
### -- 1) Import .bashrc --
### -----------------------

# Configure PATH
#  - These are line by line so that you can kill one without affecting the others.
#  - Lowest priority first, highest priority last.
export PATH=$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin/:$PATH
export PATH=/usr/local/nz/bin64:$PATH

# Netezza
export ORACLE_HOME="/usr/local/lib/oracle/instantclient"
export DYLD_LIBRARY_PATH=$ORACLE_HOME
export LD_LIBRARY_PATH=$ORACLE_HOME

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export TERM=xterm-256color

# Factor out all repeated profile initialization into .bashrc
#  - All non-login shell parameters go there
#  - All declarations repeated for each screen session go there
if [ -f ~/.bash_rc ]; then
   source ~/.bash_rc
fi
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

