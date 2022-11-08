#!/usr/bin/env sh

space() {
	case $1 in
	balance)
		yabai -m space --balance
		;;
	1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10)
		yabai -m window --space "$1"
		;;
	esac
}
