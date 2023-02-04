{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { darwin, home-manager, ... }: {
    darwinConfigurations = {
      veselins-macbook-pro = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./config/nixpkgs/darwin/configuration.nix
          home-manager.darwinModules.home-manager
          ./config/nixpkgs/home.nix
        ];
      };
    };
  };
}
