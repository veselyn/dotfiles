{
  inputs,
  self,
  ...
}: {
  flake.lib = {
    mkDarwin = {system}:
      inputs.nix-darwin.lib.darwinSystem {
        inherit system;

        modules = [
          {
            imports = [self.modules.darwin.default];
            self.modules.darwin = {
              enable = true;
            };
          }
        ];
      };

    mkHome = {
      system,
      username,
    }:
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {inherit system;};

        modules = [
          {
            imports = [self.modules.home.default];
            self.modules.home = {
              enable = true;
              inherit username;
            };
          }
        ];
      };
  };
}
