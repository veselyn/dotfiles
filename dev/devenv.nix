{inputs, ...}: {
  perSystem = {pkgs, ...}: {
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

          packages = builtins.attrValues {
            inherit
              (pkgs)
              pre-commit
              ;
          };

          treefmt = {
            enable = true;
            config = {
              programs = {
                alejandra.enable = true;
                prettier.enable = true;
                shfmt.enable = true;
                shfmt.indent_size = null;
                stylua.enable = true;
              };
            };
          };

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
            shellcheck.enable = true;
            statix.enable = true;
            treefmt.enable = true;
            trim-trailing-whitespace.enable = true;
          };
        }
      ];
    };
  };
}
