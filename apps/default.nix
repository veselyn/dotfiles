{ self, nixpkgs, flake-utils, ... }:

flake-utils.lib.eachDefaultSystemMap (
  system:
  let
    pkgs = import nixpkgs {
      inherit system; overlays = builtins.attrValues self.overlays;
    };
    scripts = pkgs.callPackage ../scripts { };
  in
  {
    battery = {
      type = "app";
      program = "${scripts.battery}/bin/battery";
    };
    flushdns = {
      type = "app";
      program = "${scripts.flushdns}/bin/flushdns";
    };
  }
)
