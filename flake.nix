{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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

  outputs = {
    self,
    darwin,
    home-manager,
    ...
  } @ inputs: {
    darwinConfigurations = {
      veselins-macbook-pro = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        specialArgs = {inherit self;};

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
                imports = [./modules/home-manager];

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

    apps = import ./apps inputs;
    formatter = import ./formatter inputs;
    overlays = import ./overlays inputs;
    packages = import ./packages inputs;
  };
}
