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

          git-hooks.hooks = {
            deadnix.enable = true;
            end-of-file-fixer.enable = true;
            lua-ls = {
              enable = true;
              settings = {
                checklevel = "Hint";
                configuration.runtime.version = "LuaJIT";
                configuration.workspace.library = ["${pkgs.neovim}/share/nvim/runtime"];
              };
            };
            statix.enable = true;
            treefmt.enable = true;
            treefmt.package = self'.formatter;
            trim-trailing-whitespace.enable = true;
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
