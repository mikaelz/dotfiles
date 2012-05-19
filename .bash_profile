
# Set terminal colors
# http://it.toolbox.com/blogs/lim/how-to-fix-colors-on-mac-osx-terminal-37214
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

PS1='\u@\h:\w\$ '

alias grep='grep --colour=always' 
alias ls='ls -Fh' 
alias vi='vim' 
alias cp='cp -v' 
alias mv='mv -v' 
alias rm='rm -i' 
