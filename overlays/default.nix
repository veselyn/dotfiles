{nixpkgs-master, ...}: {
  default = final: prev: let
    master = import nixpkgs-master {inherit (prev) system;};
    pkgs = prev.callPackages ../pkgs {};
  in {
    inherit master;

    inherit
      (pkgs)
      battery
      flushdns
      yabai
      yabaictl
      ;

    vimPlugins = prev.vimPlugins // master.vimPlugins;
  };
}
