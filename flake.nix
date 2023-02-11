{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, darwin, home-manager, ... }: {
    darwinConfigurations = {
      veselins-macbook-pro = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        modules = [
          ./modules/darwin
          home-manager.darwinModules.home-manager
          ./modules/home-manager
        ];
      };
    };

    formatter = {
      aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
    };
  };
}
