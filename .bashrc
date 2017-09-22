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

shopt -s histappend   # append to the history file, don't overwrite it
shopt -s cmdhist      # combine multiline commands in history
shopt -s cdspell      # `cd` tries to fix typos
shopt -s dirspell
shopt -s autocd
shopt -s checkwinsize # resize ouput to fit window


if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

[ -r /opt/local/etc/bash_completion ] && . /opt/local/etc/bash_completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

[ -r /usr/share/git/completion/git-prompt.sh ] && . /usr/share/git/completion/git-prompt.sh

alias D='cd ~/Downloads'
alias Dr='cd ~/Dropbox'
alias H='cd /srv/http'
alias N='cd /srv/nodejs'

# configs
alias eA='vi ~/.config/awesome/rc.lua'
alias eB='vi ~/.bashrc'
alias rB='source ~/.bashrc; echo "[ done ] source ~/.bashrc"'
alias eZ='vi ~/.zshrc'
alias eH='vi ~/.zsh_history'
alias rZ='source ~/.zshrc; echo "[ done ] source ~/.zshrc"'
alias eV='vi ~/.vimrc'
alias eG='vi ~/.gitconfig'

# commands
alias k='exit'
alias h='history'
alias la='ls -Fa'
alias ll='ls -Fhl'
alias cp='cp -rv'
alias mv='mv -v'
alias rm='rm -iv'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias yt='youtube-viewer'
alias yd='youtube-dl --recode-video mp4'
alias scp='scp -r'
alias lla='ls -Fhla'
alias lsize='ls -FShla'
alias mkdir='mkdir -p'
alias pidstat='pidstat -dlu'
alias vi='vim'
alias pgrep='pgrep -a'
alias U='sudo pacman -Syu'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias httpwritable='sudo chown -R http:http .; sudo chmod -R g+rw .'
alias _wwwwritable='sudo chown -R _www:_www .; sudo chmod -R g+rw .'
alias grep='grep --colour=auto --exclude-dir={.git,.svn,CVS} --exclude=tags'
alias nethogs='sudo nethogs eno1'
alias xlock='xlock -mode blank'
alias httpserve='python3 -m http.server'
alias p='ping google-public-dns-a.google.com'
alias phpunit='phpunit --colors=always'
alias composer="php -d memory_limit=-1 $(which composer)"
alias cdu='composer dumpautoload -o'
alias mc='TERM=xterm-256color mc'

# SVN aliases
alias svn_edit_log='svn propedit svn:log --revprop -r '
alias svn_ignore_dir='svn propedit svn:ignore '
alias svn_diff_prev='svn diff -r COMMITTED:PREV '
alias svn_cleanup="svn status --no-ignore | grep '^\?' | sed 's/^\?     //'  | xargs rm -rf"

# Docker aliases
alias d='docker'
alias ds='./docker/start.sh'
alias dps='docker ps -a'
alias di='docker inspect'
alias dit='docker exec -i -t'

# GIT aliases
alias ga='git add'
alias gb='git branch'
alias gs='git status'
alias gd='git diff'
alias gp='git pull'
alias gpu='git push'
alias gc='git commit -v'
alias gco='git checkout'
alias gg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --all --decorate --abbrev-commit --date=relative'
alias gl='git log --name-status'
alias git-last-commited-files="git diff-tree -r HEAD@{0}"
alias gdamb='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
