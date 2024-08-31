{
  agenix,
  nixpkgs-master,
  nixpkgs-stable,
  nixpkgs-unstable,
  self,
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

  pkgsUnstable = final: prev: let
    pkgsUnstable = self.lib.mkPkgs nixpkgs-unstable prev.system {overlays = [];};
  in {
  };

  pkgsStable = final: prev: let
    pkgsStable = self.lib.mkPkgs nixpkgs-stable prev.system {overlays = [];};
  in {
    inherit (pkgsStable) kitty;
  };

  pkgsMaster = final: prev: let
    pkgsMaster = self.lib.mkPkgs nixpkgs-master prev.system {overlays = [];};
  in {
  };

  agenix = agenix.overlays.default;
}
