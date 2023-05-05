{self, ...}: {
  default = final: prev: let
    scripts = prev.callPackages ../scripts {};
  in {
    inherit
      (scripts)
      battery
      flushdns
      yabaictl
      ;
  };
}
