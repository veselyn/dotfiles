{
  description = "universe";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts/main";
    treefmt-nix.url = "github:numtide/treefmt-nix/main";
    devenv.url = "github:cachix/devenv/main";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux"];

      imports = [
        ./dev
        ./lib
        ./modules
      ];
    };
}
