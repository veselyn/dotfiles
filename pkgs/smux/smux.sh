function _argc_before() {
	db=${XDG_STATE_HOME:-${HOME}/.local/state}/smux/db

	mkdir -p "$(dirname "${db}")"
	if [[ ! -e ${db} ]]; then
		echo '{}' >"${db}"
	fi
}

# @cmd Switch to a session
# @meta default-subcommand
# @arg path
function switch() {
	local path
	path=${argc_path-$(list | fzf)}

	local session
	session=$(basename "${path}")

	if ! tmux has-session -t="${session}"; then
		tmux new-session -d -c "${path}" -s "${session}"
	fi

	tmux switch-client -t="${session}"
}

# @cmd List tracked directories
# @alias ls
function list() {
	jq -r 'keys | .[]' "${db}"
}

# @cmd Add a directory to tracked list
# @arg path!
function add() {
	local result
	result=$(jq --arg path "${argc_path}" '.[$path] = {}' "${db}")
	echo "${result}" >"${db}"
}

# @cmd Remove a directory from tracked list
# @arg path!
function rm() {
	local result
	result=$(jq --arg path "${argc_path}" 'del(.[$path])' "${db}")
	echo "${result}" >"${db}"
}

eval "$(argc --argc-eval "$0" "$@")"
