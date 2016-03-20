#!/bin/sh
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

pgrep -u "${USER}" -x dropbox || ~/.dropbox-dist/dropboxd &
pgrep -u "${USER}" -x ssh-agent || eval $(ssh-agent)
# pgrep -u "${USER}" -x urxvtd || urxvtd -q -o -f &
# pgrep -u "${USER}" -x irssi || /usr/bin/screen -d -m -S irssi /usr/bin/irssi

numlockx &
xscreensaver &
xsetroot -cursor_name left_ptr &

exec awesome -c .config/awesome/rc.lua
