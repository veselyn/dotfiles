function start() {
	launchctl bootstrap "gui/${UID}" "$HOME/Library/LaunchAgents/org.nixos.$1.plist"
}

function stop() {
	launchctl bootout "gui/${UID}/org.nixos.$1"
}

function restart() {
	launchctl kickstart -k "gui/${UID}/org.nixos.$1"
}

function main() {
	case $1 in
	start | stop | restart)
		case ${2-} in
		yabai | skhd)
			"$1" "$2"
			;;
		*)
			"$1" yabai
			"$1" skhd
			;;
		esac
		;;
	load-sa)
		sudo yabai --load-sa
		;;
	esac
}

main "$@"
