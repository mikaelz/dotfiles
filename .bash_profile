#
# ~/.bash_profile
#
# Set terminal colors
# http://it.toolbox.com/blogs/lim/how-to-fix-colors-on-mac-osx-terminal-37214
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export LANG="en_US.UTF-8"
export LOCALE="UTF-8"
export LC_CTYPE="en_US.UTF-8"

export PATH="/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:~/bin:$PATH"

export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
export LESS='-i-P%f (%i/%m) Line %lt/%L'

export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="&:ls:[bf]g:exit"

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s cmdhist
shopt -s cdspell

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
	. /opt/local/etc/profile.d/bash_completion.sh
fi

export PS1='\u@\h:\w\$ '
# http://hints.macworld.com/article.php?story=20031015173932306
PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
case "$TERM" in
    screen*)
        # https://stackoverflow.com/a/2069095
        export PS1='\[\033k\033\\\]'$PS1
        ;;
esac

alias ls='ls -Fh' 
alias ll='ls -Fhla' 
alias vi='vim' 
alias grep='grep --colour=auto' 
alias ss='ssh -C' 
alias cp='cp -v' 
alias mv='mv -v' 
alias rm='rm -iv' 
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
