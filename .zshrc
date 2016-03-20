# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="gentoo"
ZSH_THEME="mike"

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(colored-man composer cp git screen svn-fast-info)
plugins=(colored-man composer cp screen svn-fast-info symfony2)

# User configuration

export PATH="$HOME/Dropbox/home/bin:/opt/subversion/bin:/opt/local/bin:$PATH"
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
export S_COLORS=auto

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias D='cd ~/Downloads'
alias W='cd /srv/http'
alias ac='cd /srv/http/atechcomp'
alias lpc='cd /srv/http/lacne-pc.sk'
alias fpc='cd /srv/http/felujitottpc'
alias cen='cd /srv/http/centralis'
alias mike='autossh -M 0 mike'
alias zeus='autossh -M 0 zeus'

# configs
alias eA="vi ~/.config/awesome/rc.lua"
alias eB="vi ~/.bashrc"
alias rB="source ~/.bashrc; echo '[ done ] source ~/.bashrc'"
alias eZ="vi ~/.zshrc"
alias rZ="source ~/.zshrc; echo '[ done ] source ~/.zshrc'"
alias eV="vi ~/.vimrc"

# commands
alias k='exit'
alias la='ls -Fa'
alias ll='ls -Fhl'
alias cp='cp -rv'
alias mv='mv -v'
alias rm='rm -iv'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias ss='DISPLAY=:0 import -window root'
alias yt="youtube-viewer"
alias yd="youtube-dl"
alias scp='scp -r'
alias lla='ls -Fhla'
alias lsize='ls -FShla'
alias mkdir='mkdir -p'
alias pidstat='pidstat -dlu'
alias vi='vim'
alias Syu='sudo pacman -Syu'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias svn_edit_log="svn propedit svn:log --revprop -r "
alias svn_ignore_dir="svn propedit svn:ignore "
alias svn_diff_prev="svn diff -r COMMITTED:PREV "
alias svn_cleanup="svn status --no-ignore | grep '^\?' | sed 's/^\?     //'  | xargs rm -rf"
alias httpwritable="sudo chown -R http:http .; sudo chmod -R g+w ."
alias _wwwwritable="sudo chown -R _www:_www .; sudo chmod -R g+w ."

# search
alias grep='grep --colour=auto --exclude-dir={.git,.svn,CVS} --exclude=tags'

# misc
alias nethogs='sudo nethogs ens33'
alias xlock='xlock -mode blank'
alias httpserve='python3 -m http.server'

alias RS='sudo systemctl restart synergys@mike'

if [[ "$(uname)" == "Linux" ]]; then
    vim() STTY=-ixon command vim "$@"

    alias ls='ls --group-directories-first --color=auto'
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="/usr/local/php5-5.6.17-20160108-105408/bin:$PATH"
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
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
fi

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/config,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'