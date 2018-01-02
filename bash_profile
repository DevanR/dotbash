## -----------------------
## -- 1) Import .bashrc --
## -----------------------

# Factor out all repeated profile initialization into .bashrc
#  - All non-login shell parameters go there
#  - All declarations repeated for each screen session go there
if [ -f ~/.bash_rc ]; then
   source ~/.bash_rc
fi
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Configure PATH
#  - These are line by line so that you can kill one without affecting the others.
#  - Lowest priority first, highest priority last.
export PATH=$PATH
export PATH=/usr/local/bin:$PATH

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export TERM=xterm-256color
