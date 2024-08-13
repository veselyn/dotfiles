{
  self,
  nixpkgs,
  treefmt,
  flake-utils,
  ...
}:
flake-utils.lib.eachDefaultSystemMap (system: let
  pkgs = self.lib.mkPkgs nixpkgs system {};
in {
  formatting = let
    treefmtModule = treefmt.lib.evalModule pkgs ../formatter/treefmt.nix;
  in
    treefmtModule.config.build.check self;
})
