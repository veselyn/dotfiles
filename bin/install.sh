#!/usr/bin/env bash

function nix() {
	command nix --extra-experimental-features 'nix-command flakes' "$@"
}

function main() {
	local configuration=$1

	sh <(curl -L https://nixos.org/nix/install) --yes
	set +u
	source /etc/bash.bashrc
	set -u

	NONINTERACTIVE=1 bash <(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)

	nix run nixpkgs#git -- clone https://github.com/veselyn/dotfiles.git
	cd dotfiles
	git remote set-url --push origin git@github.com:veselyn/dotfiles.git

	nix run nix-darwin -- switch --flake .#"$configuration"
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
	set -euo pipefail

	main "$@"
fi
