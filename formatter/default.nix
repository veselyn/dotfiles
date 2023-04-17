{ self, nixpkgs, flake-utils, ... }:

flake-utils.lib.eachDefaultSystemMap (
  system:
  let
    pkgs = import nixpkgs {
      inherit system; overlays = builtins.attrValues self.overlays;
    };
  in
  pkgs.alejandra
)
