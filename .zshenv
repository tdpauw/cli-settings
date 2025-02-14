export PATH=$PATH:~/bin
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.zsh_history"
export EDITOR=vim

setopt HIST_IGNORE_SPACE

#don't check mail
unset MAILCHECK

#Granted assume alias to source the assume script
alias assume="source assume"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

