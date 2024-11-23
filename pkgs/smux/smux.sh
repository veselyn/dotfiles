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

	local abs_path
	abs_path=$(realpath "${path}")

	local session
	session=$(basename "${abs_path}")

	if ! tmux has-session -t="${session}"; then
		tmux new-session -d -c "${abs_path}" -s "${session}"
	fi

	tmux switch-client -t="${session}"
}

# @cmd List tracked directories
# @alias ls
function list() {
	jq -r 'keys | .[]' "${db}"
}

# @cmd Add a directory to tracked list
# @arg path
function add() {
	local path=${argc_path-${PWD}}

	local abs_path
	abs_path=$(realpath "${path}")

	if [[ ! -d ${abs_path} ]]; then
		echo >&2 "error: '${path}' is not a directory"
		return 1
	fi

	if [[ $(jq --arg path "${abs_path}" 'has($path)' "${db}") == true ]]; then
		echo >&2 "error: '${path}' is already tracked"
		return 1
	fi

	local result
	result=$(jq --arg path "${abs_path}" '.[$path] = {}' "${db}")
	echo "${result}" >"${db}"
}

# @cmd Remove a directory from tracked list
# @arg path
function rm() {
	local path=${argc_path-${PWD}}

	local abs_path
	abs_path=$(realpath "${path}")

	if [[ $(jq --arg path "${abs_path}" 'has($path)' "${db}") == false ]]; then
		echo >&2 "error: '${path}' is not tracked"
		return 1
	fi

	local result
	result=$(jq --arg path "${abs_path}" 'del(.[$path])' "${db}")
	echo "${result}" >"${db}"
}

eval "$(argc --argc-eval "$0" "$@")"
