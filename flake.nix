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

    flake-utils.url = "github:numtide/flake-utils/main";
  };

  outputs = { self, nixpkgs, darwin, home-manager, flake-utils } @ inputs: {
    darwinConfigurations = {
      veselins-macbook-pro = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        specialArgs = { inherit self; };

        modules = [
          ./modules/darwin
          home-manager.darwinModules.home-manager
          {
            users.users.veselin = {
              name = "veselin";
              home = "/Users/veselin";
            };

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.veselin = {
                imports = [ ./modules/home-manager ];

                home = {
                  username = "veselin";
                  homeDirectory = "/Users/veselin";
                };
              };
            };
          }
        ];
      };
    };

    overlays = {
      scripts = final: prev:
        let packages = self.packages.${prev.system}; in {
          scripts = {
            inherit (packages) battery;
            inherit (packages) flushdns;
          };
        };
    };

    packages = import ./packages inputs;

    apps = import ./apps inputs;

    formatter = import ./formatter inputs;
  };
}
