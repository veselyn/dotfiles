{
  self,
  nixpkgs-master,
  nixpkgs-stable,
  ...
}: {
  lib = final: prev: {
    lib = prev.lib.extend (final: prev: {own = self.lib;});
  };

  pkgsOwn = final: prev: let
    pkgsOwn = prev.lib.recurseIntoAttrs (prev.callPackages ../pkgs {});
  in {
    own = {
      inherit
        (pkgsOwn)
        gitpick
        yabaictl
        ;
    };
  };

  pkgsStable = final: prev: let
    pkgsStable = self.lib.mkPkgs nixpkgs-stable prev.system {overlays = [];};
  in {
    inherit (pkgsStable) nix-init;
  };

  pkgsMaster = final: prev: let
    pkgsMaster = self.lib.mkPkgs nixpkgs-master prev.system {overlays = [];};
  in {
    inherit (pkgsMaster) delta;
  };
}
