#!/bin/sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

[[ -f ~/.Xresources ]] && xrdb -merge  -I$HOME ~/.Xresources

case $wm in
	dwm) exec dwm ;;
	*) exec i3 ;;
esac
