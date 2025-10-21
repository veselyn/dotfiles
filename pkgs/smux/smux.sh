function _argc_before() {
	readonly db=${XDG_STATE_HOME:-${HOME}/.local/state}/smux/db

	mkdir -p "$(dirname "${db}")"
	if [[ ! -e ${db} ]]; then
		echo '{}' >"${db}"
	fi
}

# @cmd Switch to a session
# @meta default-subcommand
# @meta require-tools fzf,tmux
# @arg path
function switch() {
	local path
	path=${argc_path-$($0 list --recursive | fzf)}

	if [[ -z ${path} ]]; then
		return 1
	fi

	local abs_path
	abs_path=$(realpath --no-symlinks "${path}")

	if [[ ! -d ${abs_path} ]]; then
		echo >&2 "error: '${path}' is not a directory"
		return 1
	fi

	local session
	session=$(basename "${abs_path}" | tr '.' '_') # Tmux already replaces dots with underscores.

	if ! tmux has-session -t="${session}" 2>/dev/null; then
		tmux new-session -d -c "${abs_path}" -s "${session}"
	fi

	if [[ -z ${TMUX-} ]]; then
		tmux attach-session -t="${session}"
	fi

	tmux switch-client -t="${session}"
}

# @cmd List tracked directories
# @alias ls
# @meta require-tools column,fd,jq
# @flag -r --recursive
# @flag -n --no-headers
function list() {
	local recursive=${argc_recursive-0}
	local no_headers=${argc_no_headers-0}

	if [[ ${recursive} == 1 ]]; then
		local -a paths_recursive
		readarray -t paths_recursive < <(jq -r 'to_entries[] | select(.value.recursive) | .key' "${db}")

		local -a paths_non_recursive
		readarray -t paths_non_recursive < <(jq -r 'to_entries[] | select(.value.recursive | not) | .key' "${db}")

		{
			for path_recursive in "${paths_recursive[@]}"; do
				local depth
				depth=$(jq --arg path "${path_recursive}" '.[$path].depth' "${db}")
				fd . "${path_recursive}" --type=d --exact-depth="${depth}" --format '{}'
			done

			if [[ ${#paths_non_recursive[@]} -gt 0 ]]; then
				printf '%s\n' "${paths_non_recursive[@]}"
			fi
		} | sort | uniq

		return
	fi

	if [[ ${no_headers} == 1 ]]; then
		local result
		result=$(jq -r 'keys[]' "${db}")

		if [[ -n ${result} ]]; then
			echo "${result}"
		fi

		return
	fi

	local result
	result=$(jq -r 'to_entries | sort_by(.key)[] | [.key, .value.recursive, .value.depth] | @tsv' "${db}")

	if [[ -z ${result} ]]; then
		return
	fi

	{
		echo 'PATH RECURSIVE DEPTH'
		echo "${result}"
	} | column -t
}

# @cmd Add a directory to tracked list
# @meta require-tools jq
# @flag -r --recursive
# @option -d --depth=1
# @arg path
function add() {
	local recursive=${argc_recursive-0}
	local depth=${argc_depth?}
	local path=${argc_path-${PWD}}

	local abs_path
	abs_path=$(realpath --no-symlinks "${path}")

	if [[ ! -d ${abs_path} ]]; then
		echo >&2 "error: '${path}' is not a directory"
		return 1
	fi

	if [[ $(jq --arg path "${abs_path}" 'has($path)' "${db}") == true ]]; then
		echo >&2 "error: '${path}' is already tracked"
		return 1
	fi

	local recursive_json
	if [[ ${recursive} == 1 ]]; then
		recursive_json=true
	else
		recursive_json=false
	fi

	local result
	result=$(cat "${db}")

	result=$(
		echo "${result}" | jq \
			--arg path "${abs_path}" \
			--argjson depth "${depth}" \
			--argjson recursive "${recursive_json}" \
			'.[$path] = {recursive: $recursive}'
	)

	if [[ ${recursive} == 1 ]]; then
		result=$(
			echo "${result}" | jq \
				--arg path "${abs_path}" \
				--argjson depth "${depth}" \
				'.[$path] += {depth: $depth}'
		)
	fi

	echo "${result}" >"${db}"
}

# @cmd Update a directory in tracked list
# @alias up
# @meta require-tools jq
# @option -r --recursive[true|false]
# @option -d --depth
# @arg path
function update() {
	local recursive=${argc_recursive-}
	local depth=${argc_depth-}
	local path=${argc_path-${PWD}}

	local abs_path
	abs_path=$(realpath --no-symlinks "${path}")

	if [[ $(jq --arg path "${abs_path}" 'has($path)' "${db}") == false ]]; then
		echo >&2 "error: '${path}' is not tracked"
		return 1
	fi

	local result
	result=$(cat "${db}")

	if [[ -n ${recursive} ]]; then
		result=$(
			echo "${result}" | jq \
				--arg path "${abs_path}" \
				--argjson recursive "${recursive}" \
				'.[$path] += {recursive: $recursive}'
		)
	fi

	if [[ -n ${depth} ]]; then
		result=$(
			echo "${result}" | jq \
				--arg path "${abs_path}" \
				--argjson depth "${depth}" \
				'.[$path] += {depth: $depth}'
		)
	fi

	echo "${result}" >"${db}"
}

# @cmd Remove a directory from tracked list
# @alias rm
# @meta require-tools jq
# @arg path
function remove() {
	local path=${argc_path-${PWD}}

	local abs_path
	abs_path=$(realpath --no-symlinks "${path}")

	if [[ $(jq --arg path "${abs_path}" 'has($path)' "${db}") == false ]]; then
		echo >&2 "error: '${path}' is not tracked"
		return 1
	fi

	local result
	result=$(jq --arg path "${abs_path}" 'del(.[$path])' "${db}")
	echo "${result}" >"${db}"
}

eval "$(argc --argc-eval "$0" "$@")"
