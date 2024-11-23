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
	path=${argc_path-$($0 list --recursive | fzf)}

	local abs_path
	abs_path=$(realpath "${path}")

	local session
	session=$(basename "${abs_path}")

	if ! tmux has-session -t="${session}" 2>/dev/null; then
		tmux new-session -d -c "${abs_path}" -s "${session}"
	fi

	tmux switch-client -t="${session}"
}

# @cmd List tracked directories
# @flag -r --recursive
# @alias ls
function list() {
	local recursive=${argc_recursive-0}

	if [[ ${recursive} == 1 ]]; then
		local -a paths_recursive
		readarray -t paths_recursive < <(jq -r 'to_entries[] | select(.value.recursive) | .key' "${db}")

		local -a paths_non_recursive
		readarray -t paths_non_recursive < <(jq -r 'to_entries[] | select(.value.recursive | not) | .key' "${db}")

		{
			if [[ ${#paths_recursive[@]} -gt 0 ]]; then
				fd . "${paths_recursive[@]}" --type=d --exact-depth=1 --format '{}'
			fi

			if [[ ${#paths_non_recursive[@]} -gt 0 ]]; then
				printf '%s\n' "${paths_non_recursive[@]}"
			fi
		} | sort | uniq

		return
	fi

	local result
	result=$(jq -r 'to_entries[] | [.key, .value.recursive] | @tsv' "${db}")

	{
		echo 'path recursive'
		echo "${result}"
	} | column -t
}

# @cmd Add a directory to tracked list
# @flag -r --recursive
# @arg path
function add() {
	local recursive=${argc_recursive-0}
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

	if [[ ${recursive} == 1 ]]; then
		recursive=true
	else
		recursive=false
	fi

	local result
	result=$(
		jq \
			--arg path "${abs_path}" \
			--argjson recursive "${recursive}" \
			'.[$path] = {recursive: $recursive}' \
			"${db}"
	)
	echo "${result}" >"${db}"
}

# @cmd Update a directory in tracked list
# @alias up
# @option -r --recursive[true|false]
# @arg path
function update() {
	local recursive=${argc_recursive-}
	local path=${argc_path-${PWD}}

	local abs_path
	abs_path=$(realpath "${path}")

	if [[ ! -d ${abs_path} ]]; then
		echo >&2 "error: '${path}' is not a directory"
		return 1
	fi

	if [[ $(jq --arg path "${abs_path}" 'has($path)' "${db}") == false ]]; then
		echo >&2 "error: '${path}' is not tracked"
		return 1
	fi

	local result
	result=$(cat "${db}")

	if [[ -n ${recursive} ]]; then
		result=$(
			jq \
				--arg path "${abs_path}" \
				--argjson recursive "${recursive}" \
				'.[$path] += {recursive: $recursive}' \
				"${db}"
		)
	fi

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
