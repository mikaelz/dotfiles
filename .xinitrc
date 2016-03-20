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

pgrep -u mike -x dropboxd || ~/.dropbox-dist/dropboxd &
pgrep -u mike -x urxvtd || urxvtd -q -o -f &
# pgrep -u mike -x irssi || /usr/bin/screen -d -m -S irssi /usr/bin/irssi

eval $(ssh-agent)

numlockx &
xscreensaver &
xsetroot -cursor_name left_ptr &

exec awesome -c .config/awesome/rc.lua
