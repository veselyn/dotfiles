#!/usr/bin/env sh

services() {
	case $1 in
	start | stop | restart)
		case $2 in
		yabai | skhd)
			"_$1" "$2"
			;;
		*)
			"_$1" yabai
			"_$1" skhd
			;;
		esac
		;;
	esac
}

_start() {
	launchctl bootstrap gui/"$UID" ~/Library/LaunchAgents/org.nixos."$1".plist
}

_stop() {
	launchctl bootout gui/"$UID"/org.nixos."$1"
}

_restart() {
	launchctl kickstart -k gui/"$UID"/org.nixos."$1"
}
