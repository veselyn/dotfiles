{self, ...}: {
  lib = final: prev: {
    own = self.lib;
  };

  pkgs = final: prev: let
    pkgs = prev.lib.recurseIntoAttrs (prev.callPackages ../pkgs {});
  in {
    own = {
      inherit
        (pkgs)
        battery
        flushdns
        gitpick
        yabaictl
        ;
    };
  };
}
