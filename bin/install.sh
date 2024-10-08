#!/usr/bin/env bash

set -euo pipefail

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

	nix run nixpkgs#git -- clone https://github.com/veselyn/universe.git
	cd universe
	git remote set-url --push origin git@github.com:veselyn/universe.git

	nix run nix-darwin -- switch --flake ".#${configuration}"
}

main "$@"
