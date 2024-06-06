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

    treefmt.url = "github:numtide/treefmt-nix/main";
    flake-utils.url = "github:numtide/flake-utils/main";
  };

  outputs = inputs: {
    apps = import ./apps inputs;
    checks = import ./checks inputs;
    darwinConfigurations = import ./darwin-configurations inputs;
    formatter = import ./formatter inputs;
    homeConfigurations = import ./home-configurations inputs;
    nixosConfigurations = import ./nixos-configurations inputs;
    overlays = import ./overlays inputs;
    packages = import ./packages inputs;
  };
}
