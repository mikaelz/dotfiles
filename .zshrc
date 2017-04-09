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
plugins=(symfony2)

source $ZSH/oh-my-zsh.sh

export HISTSIZE=1000000
export SAVEHIST=1000000
export PATH="$HOME/Dropbox/home/bin:/opt/subversion/bin:/opt/local/bin:/usr/local/bin:$PATH"
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
alias W='cd /srv/http'
alias ac='cd /srv/http/atechcomp.sk'
alias lpc='cd /srv/http/lacne-pc.sk'
alias fpc='cd /srv/http/felujitottpc.hu'
alias centralis='cd /srv/http/centralis'
alias kovoinox='cd /srv/http/kovoinox'
alias moda='cd /srv/http/moda.sk'
alias ssh='TERM=xterm-256color ssh'
alias mike='TERM=xterm-256color autossh -M 0 mike'
alias zeus='TERM=xterm-256color autossh -M 0 zeus'
alias jarvis='TERM=xterm-256color autossh -M 0 jarvis'
alias gutanet-srv='TERM=xterm-256color autossh -M 0 gutanet-srv'
alias atechnet-forpsi='TERM=xterm-256color autossh -M 0 atechnet-forpsi'

# configs
alias eA='vi ~/.config/awesome/rc.lua'
alias eB='vi ~/.bashrc'
alias rB='source ~/.bashrc; echo '[ done ] source ~/.bashrc''
alias eZ='vi ~/.zshrc'
alias eH='vi ~/.zsh_history'
alias rZ='source ~/.zshrc; echo '[ done ] source ~/.zshrc''
alias eV='vi ~/.vimrc'

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
alias update='sudo pacman -Syu'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias httpwritable='sudo chown -R http:http .; sudo chmod -R g+rw .'
alias _wwwwritable='sudo chown -R _www:_www .; sudo chmod -R g+rw .'
alias grep='grep --colour=auto --exclude-dir={.git,.svn,CVS} --exclude=tags'
alias nethogs='sudo nethogs eno1'
alias xlock='xlock -mode blank'
alias httpserve='python3 -m http.server'
alias p='ping google-public-dns-a.google.com'
alias phpunit='phpunit --colors=always'
alias cdu='composer dumpautoload -o'

# SVN aliases
alias svn_edit_log='svn propedit svn:log --revprop -r '
alias svn_ignore_dir='svn propedit svn:ignore '
alias svn_diff_prev='svn diff -r COMMITTED:PREV '
alias svn_cleanup='svn status --no-ignore | grep '^\?' | sed 's/^\?     //'  | xargs rm -rf'

# GIT aliases
alias gs='git status'
alias gd='git diff'
alias gp='git pull'
alias gc='git commit -v'
alias gco='git checkout'
alias gg='git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all --decorate --abbrev-commit --date=relative'
alias gl='git log --name-status'
alias git-last-commited-files="git diff-tree -r HEAD@{0}"
alias gdamb='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

alias RS='systemctl --user restart synergys.service'
alias restart-samba='sudo systemctl restart smbd.service;sudo systemctl restart nmbd.service'
alias record='ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0 ~/Downloads/screen_record.mp4'

if [[ "$(uname)" == "Linux" ]]; then
    vim() STTY=-ixon command vim "$@"

    alias ls='ls --group-directories-first --color=auto'
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="/usr/local/bin/:/usr/local/mysql/bin:/usr/local/php5/bin:$PATH"

    alias updatedb='sudo /usr/libexec/locate.updatedb'
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
