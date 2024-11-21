declare -a paths
paths+=(
	"${HOME}/dotfiles"
	"${HOME}/dev/cv"
	"${HOME}/dev/kv"
)

# @cmd Switch to a session
# @meta default-subcommand
# @arg path
function switch() {
	local path
	path=${argc_path-$(printf "%s\n" "${paths[@]}" | fzf)}

	local session
	session=$(basename "${path}")

	if ! tmux has-session -t="${session}"; then
		tmux new-session -d -c "${path}" -s "${session}"
	fi

	tmux switch-client -t="${session}"
}

eval "$(argc --argc-eval "$0" "$@")"
