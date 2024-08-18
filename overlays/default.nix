{self, ...}: {
  lib = final: prev: {
    own = self.lib;
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
}
