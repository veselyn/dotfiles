{
  self,
  nixpkgs,
  treefmt,
  flake-utils,
  ...
}:
flake-utils.lib.eachDefaultSystemMap (system: let
  pkgs = self.lib.mkPkgs nixpkgs system {};

  treefmtModule = treefmt.lib.evalModule pkgs ./treefmt.nix;
in
  treefmtModule.config.build.wrapper)
