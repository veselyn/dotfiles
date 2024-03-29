{
  self,
  nixpkgs,
  treefmt,
  flake-utils,
  ...
}:
flake-utils.lib.eachDefaultSystemMap (system: let
  pkgs = import nixpkgs {
    inherit system;
    overlays = builtins.attrValues self.overlays;
  };

  treefmtModule = treefmt.lib.evalModule pkgs ./treefmt.nix;
in
  treefmtModule.config.build.wrapper)
