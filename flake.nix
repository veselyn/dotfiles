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

  outputs = { self, nixpkgs, darwin, home-manager }: {
    darwinConfigurations = {
      veselins-macbook-pro = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        modules = [
          ./modules/darwin
          home-manager.darwinModules.home-manager
          {
            users.users.veselin = {
              name = "veselin";
              home = "/Users/veselin";
            };

            home-manager.users.veselin = {
              imports = [ ./modules/home-manager ];

              home = {
                username = "veselin";
                homeDirectory = "/Users/veselin";
              };
            };
          }
        ];
      };
    };

    packages = {
      aarch64-darwin =
        let
          system = "aarch64-darwin";
          pkgs = import nixpkgs { inherit system; };
        in
        {
          battery = pkgs.writeShellApplication {
            name = "battery";
            text = ''
              battery=$(pmset -g batt)
              percentage=$(echo "$battery" | grep -Po '\d{1,3}%')
              echo "$percentage"
            '';
          };
        };
    };

    formatter = {
      aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
    };
  };
}
