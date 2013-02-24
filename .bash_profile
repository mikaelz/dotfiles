
# Set terminal colors
# http://it.toolbox.com/blogs/lim/how-to-fix-colors-on-mac-osx-terminal-37214
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH="/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:~/bin:$PATH"

if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

EDITOR="/usr/bin/vim"
export EDITOR

PS1='\u@\h:\w\$ '

alias grep='grep --colour=always' 
alias ls='ls -Fh' 
alias vi='vim' 
alias cp='cp -iv' 
alias mv='mv -iv' 
alias rm='rm -i' 
