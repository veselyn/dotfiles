# @meta require-tools kitten
# @arg mode![light|dark|0|1] $DARKMODE
function main() {
	local mode=${argc_mode?}

	case "${mode}" in
	0) mode=light ;;
	1) mode=dark ;;
	esac

	local theme
	case ${mode} in
	light) theme='CLRS' ;;
	dark) theme='Default' ;;
	esac

	kitten themes \
		--config-file-name "${XDG_CONFIG_HOME:-${HOME}/.config}/kitty/theme.conf" \
		"${theme}"

	for socket in "${TMPDIR}"/kitty-"${USER}"-*; do
		kitten @ --to="unix:${socket}" load-config
	done
}

eval "$(argc --argc-eval "$0" "$@")"
