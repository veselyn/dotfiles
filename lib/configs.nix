toplevel @ {
  inputs,
  lib,
  self,
  withSystem,
  ...
}: {
  flake.lib = {
    mkDarwin = {
      system,
      username,
      modules ? [],
      nixpkgs ? inputs.nixpkgs,
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
            self.modules.darwin = lib.mkDefault {
              enable = true;
              inherit username nixpkgs;
            };
          }

          {
            imports = [self.modules.darwin.home];
            self.modules.darwin.home = lib.mkDefault {
              enable = true;
              inherit username;
            };
          }

          {
            imports = [self.modules.generic.default];
            self.modules.generic = lib.mkDefault {
              enable = true;
              inherit username;
            };
          }

          {imports = modules;}
        ];
      };

    mkNixOS = {
      system,
      username,
      modules ? [],
      nixpkgs ? inputs.nixpkgs,
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit toplevel;
          perSystem = withSystem system (ctx: ctx);
        };

        modules = [
          {
            imports = [self.modules.nixos.default];
            self.modules.nixos = lib.mkDefault {
              enable = true;
              inherit username;
            };
          }

          {
            imports = [self.modules.nixos.home];
            self.modules.nixos.home = lib.mkDefault {
              enable = true;
              inherit username;
            };
          }

          {
            imports = [self.modules.generic.default];
            self.modules.generic = lib.mkDefault {
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
      nixpkgs ? inputs.nixpkgs,
    }: let
      pkgs = import nixpkgs {inherit system;};
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
            self.modules.home = lib.mkDefault {
              enable = true;
              inherit username;
            };
          }

          {
            imports = [self.modules.generic.default];
            self.modules.generic = lib.mkDefault {
              enable = true;
              inherit username;
            };
          }

          {imports = modules;}
        ];
      };
  };
}
