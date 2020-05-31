#!/bin/sh


# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Picom - compton for transparency
$COMPOSITOR -b

# Set some random wallpaper
wallpaper

# Window Manager: dwm
dwmblocks &
exec dwm
