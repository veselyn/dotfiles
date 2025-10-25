# @meta require-tools op
# @flag -m --mask
# @option -e --env*
# @arg cmd
function main() {
	local mask=${argc_mask-0}
	local envs=("${argc_env[@]}")
	local cmd=${argc_cmd-${SHELL}}

	local -a args

	if [[ ${mask} == 0 ]]; then
		args+=("--no-masking")
	fi

	for env in "${envs[@]}"; do
		args+=("--env-file" "${env}")
	done

	SHLVL=$((SHLVL - 1)) op run "${args[@]}" -- "${cmd}"
}

eval "$(argc --argc-eval "$0" "$@")"
