### -----------------------
### -- 1) Import .bashrc --
### -----------------------

# Configure PATH
#  - These are line by line so that you can kill one without affecting the others.
#  - Lowest priority first, highest priority last.
export PATH=$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin/:$PATH


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

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# ruby
eval "$(rbenv init -)"

# homebrew
export PATH="/usr/local/sbin:$PATH"

# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/devan/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/devan/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/devan/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/devan/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

export PATH="$HOME/.cargo/bin:$PATH"
