#!/bin/sh
#usr/bin/prime-offload

export XDG_SESSION_TYPE=x11
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# resolution
xrandr --auto
if [[ $(xrandr -q | grep 'HDMI-1-1 connected') ]]; then
    xrandr --output HDMI-1-1 --left-of eDP-1-1 --primary
    xrandr --output eDP-1-1 --mode 1600x900
fi

# set cursor
xsetroot -cursor_name left_ptr

# qt5 themes
export QT_STYLE_OVERRIDE=kvantum

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec bspwm
