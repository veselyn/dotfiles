{
  description = "dotfiles";

      nixConfig = {
      trusted-substituters = [
        "https://nix-community.cachix.org"
        "https://raspberry-pi-nix.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "raspberry-pi-nix.cachix.org-1:WmV2rdSangxW0rZjY/tBvBDSaNFQ3DyEQsVw8EvHn9o="
      ];
      };

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
    raspberry-pi-nix.url = "github:nix-community/raspberry-pi-nix/master";
    raspberry-pi-nix.inputs.nixpkgs.follows = "nixpkgs";
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
