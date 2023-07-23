{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
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
  };

  outputs = inputs: {
    apps = import ./apps inputs;
    darwinConfigurations = import ./darwinConfigurations inputs;

    homeConfigurations = {
      "veselin" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "aarch64-darwin";
          overlays = builtins.attrValues inputs.self.overlays;
        };

        modules = [
          {
            imports = [./modules/home];

            home = {
              username = "veselin";
              homeDirectory = "/Users/veselin";
            };
          }
        ];
      };
    };

    formatter = import ./formatter inputs;
    overlays = import ./overlays inputs;
    packages = import ./packages inputs;
  };
}
