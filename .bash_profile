#
# ~/.bash_profile
#
# http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff
# http://stefaanlippens.net/bashrc_and_others

# Activate NumLock
# setleds -D +num

# Load .profile, containing login, non-bash related initializations.
[[ -f ~/.profile ]] && . ~/.profile

# Load .bashrc, containing non-login related bash initializations.
[[ -f ~/.bashrc ]] && . ~/.bashrc

