#!/usr/bin/env sh

battery=BAT0
capacity=$(cat /sys/class/power_supply/$battery/capacity)
status="$(cat /sys/class/power_supply/$battery/status)"

bat_status () {
	if [ $status = "Charging" ]; then
		echo "  $capacity"
	elif [ $status = "Discharging" ]; then
		if [ $capacity -lt 10 ]; then
			echo "  $capacity%"
		elif [ $capacity -lt 40 ]; then
			echo "  $capacity%"
		elif [ $capacity -lt 70 ]; then
			echo "  $capacity%"
		elif [ $capacity -lt 90 ]; then
			echo "  $capacity%"
		elif [ $capacity -gt 90 ]; then
			echo "  $capacity%"
		else
			exit
		fi
	fi
}

bat_status
