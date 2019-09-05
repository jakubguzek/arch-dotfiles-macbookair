#!/usr/bin/env bash

. "${HOME}/.cache/wal/colors.sh"

color_dunst_update () {
	pkill dunst
	dunst \
		-lb "${color0}" \
		-nb "${color0}" \
		-cb "${color0}" \
		-lf "${color7}" \
		-nf "${color7}" \
		-cf "${color7}" &}

color_dunst_update
