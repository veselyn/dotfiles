# @flag -r --recursive
# @arg rev!
# @arg path!
function main() {
	local recursive=${argc_recursive-0}
	local rev=${argc_rev?}
	local path=${argc_path?}

	if [[ ! -e ${path} ]]; then
		echo >&2 "error: '${path}' does not exist"
		return 1
	fi

	if [[ -d ${path} && ${recursive} == 0 ]]; then
		echo >&2 "error: '${path}' is a directory"
		return 1
	fi

	local files
	files=$(git ls-tree -r --name-only --full-name "${rev}" "${path}")

	local root
	root=$(git rev-parse --show-toplevel)

	for file in ${files}; do
		git show "${rev}:${file}" >"${root}/${file}"
	done
}

eval "$(argc --argc-eval "$0" "$@")"
