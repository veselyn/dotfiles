# @cmd Start services
# @meta require-tools launchctl
# @arg service[=all|yabai|skhd|jankyborders]
function start() {
	local service=${argc_service?}

	local -a services
	if [[ ${service} == 'all' ]]; then
		services+=('yabai' 'skhd' 'jankyborders')
	else
		services+=("${service}")
	fi

	for service in "${services[@]}"; do
		launchctl bootstrap "gui/${UID}" "${HOME}/Library/LaunchAgents/org.nixos.${service}.plist"
	done
}

# @cmd Stop services
# @meta require-tools launchctl
# @arg service[=all|yabai|skhd|jankyborders]
function stop() {
	local service=${argc_service?}

	local -a services
	if [[ ${service} == 'all' ]]; then
		services+=('yabai' 'skhd' 'jankyborders')
	else
		services+=("${service}")
	fi

	for service in "${services[@]}"; do
		launchctl bootout "gui/${UID}/org.nixos.${service}"
	done
}

# @cmd Restart services
# @meta require-tools launchctl
# @arg service[=all|yabai|skhd|jankyborders]
function restart() {
	local service=${argc_service?}

	local -a services
	if [[ ${service} == 'all' ]]; then
		services+=('yabai' 'skhd' 'jankyborders')
	else
		services+=("${service}")
	fi

	for service in "${services[@]}"; do
		launchctl kickstart -k "gui/${UID}/org.nixos.${service}"
	done
}

# @cmd Load scripting additions
# @meta require-tools yabai
function load-sa() {
	sudo yabai --load-sa
}

eval "$(argc --argc-eval "$0" "$@")"
