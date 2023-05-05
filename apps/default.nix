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
  battery = flake-utils.lib.mkApp {drv = scripts.battery;};
  flushdns = flake-utils.lib.mkApp {drv = scripts.flushdns;};
  yabaictl = flake-utils.lib.mkApp {drv = scripts.yabaictl;};
})
