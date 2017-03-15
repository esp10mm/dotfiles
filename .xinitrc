#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
# . /etc/X11/Xsession
# exec i3
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi
ibus-daemon -drx
exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
