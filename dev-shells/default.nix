{
  devenv,
  flake-utils,
  nixpkgs,
  self,
  ...
} @ inputs:
flake-utils.lib.eachDefaultSystemMap (system: let
  pkgs = self.lib.mkPkgs nixpkgs system {};
  formatter = self.formatter.${system};
in {
  default = devenv.lib.mkShell {
    inherit inputs pkgs;
    modules = [
      {
        packages = [
          formatter
        ];

        pre-commit = {
          hooks = {
            treefmt.enable = true;
            treefmt.package = formatter;
          };
        };
      }
    ];
  };
})
