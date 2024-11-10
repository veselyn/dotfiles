{
  inputs,
  self,
  ...
}: {
  perSystem = {pkgs, ...}: let
    treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs {
      projectRootFile = "flake.nix";

      programs = {
        alejandra.enable = true;
        shfmt.enable = true;
        shfmt.indent_size = null;
        stylua.enable = true;
      };
    };
  in {
    formatter = treefmtEval.config.build.wrapper;
    checks.formatting = treefmtEval.config.build.check self;
  };
}
