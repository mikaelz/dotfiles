#
# ~/.bashrc
#
# http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Set terminal colors
alias ls='ls --color=auto -Fh' 

if [ "$(uname)" == "Darwin" ]; then
    # http://it.toolbox.com/blogs/lim/how-to-fix-colors-on-mac-osx-terminal-37214
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
    alias ls='ls -GFh' 

    # http://hints.macworld.com/article.php?story=20031015173932306
    PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
    case "$TERM" in
        screen*)
            # https://stackoverflow.com/a/2069095
            export PS1='\[\033k\033\\\]'$PS1
            ;;
        xterm-256*)
            # https://stackoverflow.com/a/2069095
            export PS1='\[\033k\033\\\]'$PS1
            ;;
    esac

fi

if [ "$(uname)" == "Linux" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

export PS1='\u@\h:\w\$ '

export LANG="en_US.UTF-8"
export LOCALE="UTF-8"
export LC_CTYPE="en_US.UTF-8"

export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTIGNORE="&:ls:[bf]g:exit:config:netrc:clear"
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

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

[ -r /usr/share/git/completion/git-prompt.sh ] && . /usr/share/git/completion/git-prompt.sh


alias ll='ls -Fhla' 
alias lsize='ls -FShla' 
alias vi='vim' 
alias ss='ssh -C' 
alias cp='cp -v' 
alias mv='mv -v' 
alias rm='rm -iv' 
alias rm='rm -iv' 
alias pidstat='pidstat -dlu' 
alias grep='grep --colour=auto --exclude-dir=\.svn --exclude-dir=\.git' 
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
alias xlock='xlock -mode blank' 

