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
in
  builtins.mapAttrs (_: drv: flake-utils.lib.mkApp {inherit drv;}) {
    inherit
      (pkgs)
      battery
      flushdns
      yabaictl
      ;
  })
