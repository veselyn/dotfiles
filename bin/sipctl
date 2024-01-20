#!/usr/bin/env bash

function recovery() {
	[[ ${__OSINSTALL_ENVIRONMENT:-0} == 1 ]]
}

function main() {
	local command=$1

	case "$command" in
	disable)
		if recovery; then
			csrutil enable --without fs --without debug --without nvram
		else
			sudo nvram boot-args=-arm64e_preview_abi
		fi
		;;
	enable)
		if recovery; then
			csrutil enable
		else
			sudo nvram -d boot-args
		fi
		;;
	status)
		csrutil status
		set +e
		nvram boot-args
		set -e
		;;
	*)
		echo >&2 'unknown command'
		return 1
		;;
	esac
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
	set -euo pipefail

	main "$@"
fi
