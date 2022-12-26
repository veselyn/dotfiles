#!/usr/bin/env sh

run() {
	case $1 in
	terminal)
		"_run_$1"
		;;
	esac
}

_run_terminal() {
	kitty
}
