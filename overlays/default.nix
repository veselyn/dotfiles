{self, ...}: {
  scripts = final: prev: let
    scripts = final.callPackages ../scripts {};
  in {
    scripts = {
      inherit (scripts) battery;
      inherit (scripts) flushdns;
      inherit (scripts) yabaictl;
    };
  };
}
