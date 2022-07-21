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
	brew services start "$1"
}

_stop() {
	brew services stop "$1"
}

_restart() {
	brew services restart "$1"
}
