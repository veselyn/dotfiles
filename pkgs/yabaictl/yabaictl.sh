# @cmd Start services
# @arg service[=all|yabai|skhd]
function start() {
	local service=${argc_service?}

	local -a services
	if [[ ${service} == 'all' ]]; then
		services+=('yabai' 'skhd')
	else
		services+=("${service}")
	fi

	for service in "${services[@]}"; do
		launchctl bootstrap "gui/${UID}" "${HOME}/Library/LaunchAgents/org.nixos.${service}.plist"
	done
}

# @cmd Stop services
# @arg service[=all|yabai|skhd]
function stop() {
	local service=${argc_service?}

	local -a services
	if [[ ${service} == 'all' ]]; then
		services+=('yabai' 'skhd')
	else
		services+=("${service}")
	fi

	for service in "${services[@]}"; do
		launchctl bootout "gui/${UID}/org.nixos.${service}"
	done
}

# @cmd Restart services
# @arg service[=all|yabai|skhd]
function restart() {
	local service=${argc_service?}

	local -a services
	if [[ ${service} == 'all' ]]; then
		services+=('yabai' 'skhd')
	else
		services+=("${service}")
	fi

	for service in "${services[@]}"; do
		launchctl kickstart -k "gui/${UID}/org.nixos.${service}"
	done
}

# @cmd Load scripting additions
function load-sa() {
	sudo yabai --load-sa
}

eval "$(argc --argc-eval "$0" "$@")"
