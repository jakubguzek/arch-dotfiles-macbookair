#!/bin/sh

if [ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]; then
	exit
elif [ "$(cat /sys/class/power_supply/BAT0/capacity)" -lt 10 ]; then
	sudo -u jakubguzek DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "  Battery is below 10%"
elif [ "$(cat /sys/class/power_supply/BAT0/capacity)" = 25 ]; then
	sudo -u jakubguzek DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "  Battery is below 25%"
else
	exit
fi
