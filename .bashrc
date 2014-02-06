#
# ~/.bashrc
#
# http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff

# Set terminal colors
# http://it.toolbox.com/blogs/lim/how-to-fix-colors-on-mac-osx-terminal-37214
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export LANG="en_US.UTF-8"
export LOCALE="UTF-8"
export LC_CTYPE="en_US.UTF-8"

export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s cmdhist
shopt -s cdspell
# Make bash check its window size after a process completes
shopt -s checkwinsize

if [ -f /opt/local/etc/bash_completion ]; then
	source /opt/local/etc/bash_completion
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
alias lsize='ls -FShla' 
alias vi='vim' 
alias ss='ssh -C' 
alias cp='cp -v' 
alias mv='mv -v' 
alias rm='rm -iv' 
alias grep='grep --colour=auto --exclude-dir=\.svn' 
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
