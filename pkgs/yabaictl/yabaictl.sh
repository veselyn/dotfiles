start() {
	launchctl bootstrap gui/"$UID" ~/Library/LaunchAgents/org.nixos."$1".plist
}

stop() {
	launchctl bootout gui/"$UID"/org.nixos."$1"
}

restart() {
	launchctl kickstart -k gui/"$UID"/org.nixos."$1"
}

case ${1-} in
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
esac
