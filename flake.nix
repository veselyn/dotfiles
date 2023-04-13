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

  outputs = { self, nixpkgs, darwin, home-manager, flake-utils }: {
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

    packages = flake-utils.lib.eachDefaultSystemMap (system:
      let
        pkgs = import nixpkgs {
          inherit system; overlays = builtins.attrValues self.overlays;
        };
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
        flushdns = pkgs.writeShellApplication {
          name = "flushdns";
          text = ''
            dscacheutil -flushcache
            killall -HUP mDNSResponder
          '';
        };
      }
    );

    apps = flake-utils.lib.eachDefaultSystemMap (system:
      let packages = self.packages.${system}; in {
        battery = {
          type = "app";
          program = "${packages.battery}/bin/battery";
        };
        flushdns = {
          type = "app";
          program = "${packages.flushdns}/bin/flushdns";
        };
      }
    );

    formatter = flake-utils.lib.eachDefaultSystemMap (system:
      let
        pkgs = import nixpkgs {
          inherit system; overlays = builtins.attrValues self.overlays;
        };
      in
      pkgs.nixpkgs-fmt
    );
  };
}
