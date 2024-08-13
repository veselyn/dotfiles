{
  nixpkgs-stable,
  nixpkgs-master,
  ...
}: {
  default = final: prev: let
    stable = import nixpkgs-stable {inherit (prev) system;};
    master = import nixpkgs-master {inherit (prev) system;};
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
