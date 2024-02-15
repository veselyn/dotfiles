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
in {
  formatting = let
    treefmtModule = treefmt.lib.evalModule pkgs ../formatter/treefmt.nix;
  in
    treefmtModule.config.build.check self;
})
