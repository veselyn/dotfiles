# @arg rev!
# @arg path!
function main() {
	local rev=${argc_rev?}
	local path=${argc_path?}

	local files
	files=$(git ls-tree -r --name-only "${rev}" "${path}")

	for file in ${files}; do
		git show "${rev}:${file}" >"${file}"
	done
}

eval "$(argc --argc-eval "$0" "$@")"
