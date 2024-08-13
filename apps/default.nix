{
  self,
  nixpkgs,
  flake-utils,
  ...
}:
flake-utils.lib.eachDefaultSystemMap (system: let
  pkgs = self.lib.mkPkgs nixpkgs system {};
in
  builtins.mapAttrs (_: drv: flake-utils.lib.mkApp {inherit drv;}) {
    inherit
      (pkgs)
      battery
      flushdns
      gitpick
      yabaictl
      ;
  })
