{self, ...}: {
  lib = final: prev: {
    own = self.lib;
  };

  pkgs = final: prev: let
    ownPkgs = prev.lib.recurseIntoAttrs (prev.callPackages ../pkgs {});
  in {
    own = {
      inherit
        (ownPkgs)
        gitpick
        yabaictl
        ;
    };
  };
}
