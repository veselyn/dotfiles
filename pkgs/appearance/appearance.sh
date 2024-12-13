# @arg mode![light|dark|0|1] $DARKMODE
function main() {
	local mode=${argc_mode?}

	case "${mode}" in
	0) mode=light ;;
	1) mode=dark ;;
	esac

	echo "$(/bin/date) ${mode}" >/tmp/mode
}

eval "$(argc --argc-eval "$0" "$@")"
