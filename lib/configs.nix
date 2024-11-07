{
  inputs,
  self,
  ...
}: {
  flake.lib = {
    mkDarwin = {
      system,
      username,
    }:
      inputs.nix-darwin.lib.darwinSystem {
        inherit system;

        specialArgs = {inherit inputs;};

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
        ];
      };

    mkHome = {
      system,
      username,
    }: let
      pkgs = import inputs.nixpkgs {inherit system;};
    in
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {inherit inputs;};

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
        ];
      };
  };
}
