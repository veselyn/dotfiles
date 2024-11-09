toplevel @ {
  inputs,
  self,
  withSystem,
  ...
}: {
  flake.lib = {
    mkDarwin = {
      system,
      username,
      modules ? [],
    }:
      inputs.nix-darwin.lib.darwinSystem {
        inherit system;

        specialArgs = {
          inherit toplevel;
          perSystem = withSystem system (ctx: ctx);
        };

        modules = [
          {
            imports = [self.modules.darwin.default];
            self.modules.darwin = {
              enable = true;
              inherit username;
            };
          }

          {
            imports = [self.modules.darwin.home];
            self.modules.darwin.home = {
              enable = true;
              inherit username;
            };
          }

          {
            imports = [self.modules.generic.default];
            self.modules.generic = {
              enable = true;
            };
          }

          {imports = modules;}
        ];
      };

    mkNixOS = {
      system,
      username,
      modules ? [],
    }:
      inputs.nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit toplevel;
          perSystem = withSystem system (ctx: ctx);
        };

        modules = [
          {
            imports = [self.modules.nixos.default];
            self.modules.nixos = {
              enable = true;
              inherit username;
            };
          }

          {
            imports = [self.modules.nixos.home];
            self.modules.nixos.home = {
              enable = true;
              inherit username;
            };
          }

          {imports = modules;}
        ];
      };

    mkHome = {
      system,
      username,
      modules ? [],
    }: let
      pkgs = import inputs.nixpkgs {inherit system;};
    in
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit toplevel;
          perSystem = withSystem system (ctx: ctx);
        };

        modules = [
          {
            imports =
              if pkgs.stdenv.isDarwin
              then [self.modules.home.darwin]
              else [self.modules.home.linux];
            self.modules.home = {
              enable = true;
              inherit username;
            };
          }

          {
            imports = [self.modules.generic.default];
            self.modules.generic = {
              enable = true;
            };
          }

          {imports = modules;}
        ];
      };
  };
}
