#!/usr/bin/env sh

. $HOME/.cache/wal/colors.sh

def_wallpaper="$HOME/Pictures/Neuron_var.jpg"
sol_sample="$HOME/Pictures/Solarized.png"
sol_wallpaper="$HOME/Pictures/Solarized_wallpaper.jpg"

if [ "$wallpaper" = "$def_wallpaper" ]; then
	wal -q -b "#1a1a1a" -i $sol_sample &
	xrdb ~/.Solarized
	xwallpaper --zoom $sol_sample &
elif [ "$wallpaper" != "$def_wallpaper" ]; then
	wal -q -b "#1a1a1a" -i $def_wallpaper &
	xrdb ~/.Xresources
	xwallpaper --zoom $def_wallpaper &
else
	exit
fi

i3-msg restart
sleep 2
. $HOME/.cache/wal/colors.sh
[ "$wallpaper" = "$sol_sample" ] && dunst_colors.sh && notify-send -u low "Reader mode on"
[ "$wallpaper" = "$def_wallpaper" ] && dunst_colors.sh && notify-send -u low "Reader mode off"
