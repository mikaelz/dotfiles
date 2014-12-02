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

if [ "pidof mpdscribble >& /dev/null" > 0 ]; then
    [[ -f ~/.mpdscribble/mpdscribble.conf ]] && mpdscribble;
fi

~/.dropbox-dist/dropboxd &

urxvtd -q -o -f &

numlockx &

exec awesome -c .config/awesome/rc.lua
