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

alias ls='ls --color=auto -Fh' 

if [ "$(uname)" == "Darwin" ]; then
    # http://it.toolbox.com/blogs/lim/how-to-fix-colors-on-mac-osx-terminal-37214
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
    alias ls='ls -GFh' 

    # http://hints.macworld.com/article.php?story=20031015173932306
     PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
     case "$TERM" in
         screen*|xterm*)
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
export PS1='\[\033k\033\\\]'$PS1

export LANG="en_US.UTF-8"
export LOCALE="UTF-8"
export LC_CTYPE="en_US.UTF-8"

export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTIGNORE="&:ls:[bf]g:exit:config:netrc:clear"
export HISTCONTROL=ignoreboth

export GREP_OPTIONS='--color=auto'

shopt -s histappend   # append to the history file, don't overwrite it
shopt -s cmdhist      # combine multiline commands in history
shopt -s cdspell      # `cd` tries to fix typos
shopt -s dirspell # 2>/dev/null
shopt -s autocd   # 2>/dev/null
shopt -s checkwinsize # resize ouput to fit window


if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

[ -r /opt/local/etc/bash_completion ] && . /opt/local/etc/bash_completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r /usr/share/git/completion/git-prompt.sh ] && . /usr/share/git/completion/git-prompt.sh


# navigation
alias D="pushd ~/Downloads"
alias wrk='cd /home/http' 

# configs
alias eA="vi ~/.config/awesome/rc.lua"
alias eB="vi ~/.bashrc"
alias rB="source ~/.bashrc; echo '[ done ] source ~/.bashrc'"
alias eZ="vi ~/.zshrc"
alias rZ="source ~/.zshrc; echo '[ done ] source ~/.zshrc'"
alias eV="vi ~/.vimrc"

# commands
alias v='vim' 
alias k='exit' 
alias la='ls -Fa' 
alias ll='ls -Fhl' 
alias vi='vim' 
alias cp='cp -rv' 
alias mv='mv -v' 
alias rm='rm -iv' 
alias ss='DISPLAY=:0 import -window root'
alias yt="youtube-viewer"
alias yd="youtube-dl"
alias ssc='ssh -C' 
alias scp='scp -r' 
alias lla='ls -Fhla' 
alias lsize='ls -FShla' 
alias mkdir='mkdir -p' 
alias pidstat='pidstat -dlu' 

# search
alias grep='grep --exclude-dir=\.svn --exclude-dir=\.git' 
alias g='grep -i' 
alias gr='grep -ir' 

# misc
alias nethogs='sudo nethogs ens33' 
alias xlock='xlock -mode blank' 
alias webshare='echo "Visit http://$(hostname):8080/"; python3 -m http.server 8080'

