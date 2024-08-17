{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils/main";
    treefmt.url = "github:numtide/treefmt-nix/main";
    devenv.url = "github:cachix/devenv/main";
  };

  outputs = inputs: let
    callOutput = file: import file inputs;
  in {
    apps = callOutput ./apps;
    checks = callOutput ./checks;
    darwinConfigurations = callOutput ./darwin-configurations;
    devShells = callOutput ./dev-shells;
    formatter = callOutput ./formatter;
    homeConfigurations = callOutput ./home-configurations;
    lib = callOutput ./lib;
    nixosConfigurations = callOutput ./nixos-configurations;
    overlays = callOutput ./overlays;
    packages = callOutput ./packages;
  };
}
