{inputs, ...}: {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    devShells.default = inputs.devenv.lib.mkShell {
      inherit inputs pkgs;

      modules = [
        {
          languages = {
            lua.enable = true;
            lua.package = pkgs.luajit;
            nix.enable = true;
            shell.enable = true;
          };

          packages = [
            self'.formatter
          ];

          pre-commit.hooks.deadnix.enable = true;

          pre-commit.hooks.statix = let
            config = (pkgs.formats.toml {}).generate "statix.toml" {
              disabled = ["repeated_keys"];
            };
          in {
            enable = true;
            args = ["--config" "${config}"];
          };

          pre-commit.hooks.treefmt = {
            enable = true;
            package = self'.formatter;
          };
        }
      ];
    };

    packages = {
      devenv-test = self'.devShells.default.config.test;
      devenv-up = self'.devShells.default.config.procfileScript;
    };
  };
}
