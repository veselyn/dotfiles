# shellcheck shell=bash

# @meta require-tools op
# @flag -m --mask
# @option -e --env*
# @arg cmd
function main() {
	local mask=${argc_mask-0}
	local cmd=${argc_cmd-${SHELL}}

	local -a envs

	if [[ -v argc_env ]]; then
		envs=("${argc_env[@]?}")
	fi

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
