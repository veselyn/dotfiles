_: {
  default = final: prev: let
    pkgs = prev.callPackages ../pkgs {};
  in {
    inherit
      (pkgs)
      battery
      flushdns
      yabai
      yabaictl
      ;
  };
}
