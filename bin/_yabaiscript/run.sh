#!/usr/bin/env sh

run() {
	case $1 in
	terminal)
		"_run_$1"
		;;
	esac
}

_run_terminal() {
	/Applications/kitty.app/Contents/MacOS/kitty -1 -d ~
}
