#!/usr/bin/env sh

toggle() {
	case $1 in
	zoom-parent | zoom-fullscreen | split | float)
		yabai -m window --toggle "$1"
		;;
	esac
}
