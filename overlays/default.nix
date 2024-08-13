{
  nixpkgs-stable,
  nixpkgs-master,
  self,
  ...
}: {
  lib = final: prev: {
    lib = prev.lib.extend (finalLib: prevLib: self.lib);
  };

  pkgs = final: prev: let
    stable = prev.lib.mkPkgs nixpkgs-stable prev.system {};
    master = prev.lib.mkPkgs nixpkgs-master prev.system {};
    pkgs = prev.lib.recurseIntoAttrs (prev.callPackages ../pkgs {});
  in {
    inherit stable;
    inherit master;

    inherit
      (pkgs)
      battery
      flushdns
      gitpick
      yabaictl
      ;
  };
}
