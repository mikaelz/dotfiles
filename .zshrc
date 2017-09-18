# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose git-open screen wp-cli)

source $ZSH/oh-my-zsh.sh
[ -f .zshrc_priv ] && source .zshrc_priv
[ -f .zshrc_host ] && source .zshrc_host

export HISTSIZE=1000000
export SAVEHIST=1000000
export PATH="$HOME/Dropbox/home/bin:./node_modules/.bin:$HOME/.composer/vendor/bin:/opt/local/bin:/usr/local/bin:$PATH"
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
# export VDPAU_DRIVER=nvidia
# export LIBVA_DRIVER_NAME=vdpau

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[cyan]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
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
alias composer="php -d memory_limit=-1 $(which -p composer)"
alias cdu='composer dumpautoload -o'
alias mc='TERM=xterm-256color mc'

# SVN aliases
alias svn_edit_log='svn propedit svn:log --revprop -r '
alias svn_ignore_dir='svn propedit svn:ignore '
alias svn_diff_prev='svn diff -r COMMITTED:PREV '
alias svn_cleanup='svn status --no-ignore | grep '^\?' | sed 's/^\?     //'  | xargs rm -rf'

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

alias RS='systemctl --user restart synergys.service'
alias restart-samba='sudo systemctl restart smbd.service;sudo systemctl restart nmbd.service'
alias record='ffmpeg -f alsa -ac 2 -i plughw:0,0 -f x11grab -r 30 -s 1920x1080 -i :0.0 -vcodec libx264 -preset ultrafast -threads 5 ~/Downloads/record_screencast.mkv'

if [[ "$(uname)" == "Linux" ]]; then
    vim() STTY=-ixon command vim "$@"

    alias ls='ls --group-directories-first --color=auto'
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    alias rH='echo -e "Restarting Apache" && sudo systemctl restart httpd.service && systemctl status httpd.service'
    alias kH='echo -e "Killing Apache" && sudo systemctl stop httpd.service && systemctl status httpd.service'
    alias sH='echo -e "Starting Apache" && sudo systemctl start httpd.service && systemctl status httpd.service'
    alias rM='echo -e "Restarting MySQL" && sudo systemctl restart mariadb.service && systemctl status mariadb.service'
fi

if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="/usr/local/bin/:/usr/local/mysql/bin:/usr/local/php5/bin:$PATH"

    alias updatedb='sudo /usr/libexec/locate.updatedb'
    alias rH='echo -e "Restarting Apache" && sudo apachectl restart'
    alias rM='echo -e "Restarting MySQL" && sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist && sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'
fi

if [ -f $HOME/.dircolors ]
then
    eval `dircolors -b $HOME/.dircolors`
fi

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
if is-at-least 4.2.0; then
  # open browser on urls
  _browser_fts=(htm html de org net com at cx nl se dk dk php)
  for ft in $_browser_fts ; do alias -s $ft=$BROWSER ; done

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

  _image_fts=(jpg jpeg png gif mng tiff tif xpm)
  for ft in $_image_fts ; do alias -s $ft=$XIVIEWER; done

  _media_fts=(ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts ; do alias -s $ft=mplayer ; done

  #read documents
  alias -s pdf=mupdf

  #list whats inside packed file
  alias -s zip='unzip -l'
  alias -s rar='unrar l'
  alias -s tar='tar tf'
  alias -s tar.gz='echo '
  alias -s ace='unace l'
fi

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/config,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# https://www.ostechnix.com/easy-fast-way-share-files-internet-command-line/
transfer() {
    if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
    tmpfile=$( mktemp -t transferXXX );
    if tty -s;
    then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
    else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
    fi;
    cat $tmpfile;
    echo -e "\n";
    rm -f $tmpfile;
}

accept-line() {: "${BUFFER:="ls -lah"}"; zle ".$WIDGET"}
zle -N accept-line
