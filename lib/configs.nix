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
  };
}
