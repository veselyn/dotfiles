# shellcheck shell=bash

# @meta require-tools git
# @flag -r --recursive
# @arg rev!
# @arg path!
function main() {
	local recursive=${argc_recursive-0}
	local rev=${argc_rev?}
	local path=${argc_path?}

	if ! git cat-file -e "${rev}:${path}" 2>/dev/null; then
		echo >&2 "error: path '${path}' does not exist in '${rev}'"
		return 1
	fi

	if [[ $(git cat-file -t "${rev}:${path}" 2>/dev/null) == 'tree' && ${recursive} == 0 ]]; then
		echo >&2 "error: -r not specified; omitting directory '${path}'"
		return 1
	fi

	local files
	files=$(git ls-tree -r --name-only --full-name "${rev}" "${path}")

	local root
	root=$(git rev-parse --show-toplevel)

	cd "${root}" || return

	for file in ${files}; do
		local dir
		dir=$(dirname "${file}")

		mkdir -p "${dir}"

		git show "${rev}:${file}" >"${file}"
	done
}

eval "$(argc --argc-eval "$0" "$@")"
