{
  self,
  nixpkgs,
  flake-utils,
  ...
}:
flake-utils.lib.eachDefaultSystemMap (system: let
  pkgs = import nixpkgs {
    inherit system;
    overlays = builtins.attrValues self.overlays;
  };
  scripts = pkgs.callPackages ../scripts {};
in {
  inherit
    (scripts)
    battery
    flushdns
    yabaictl
    ;
})
