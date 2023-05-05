{self, ...}: {
  scripts = final: prev: let
    scripts = prev.callPackages ../scripts {};
  in {
    scripts = {
      inherit (scripts) battery;
      inherit (scripts) flushdns;
      inherit (scripts) yabaictl;
    };
  };
}
