{ self, ... }:

{
  scripts = final: prev:
    let scripts = final.callPackage ../scripts { }; in {
      scripts = {
        inherit (scripts) battery;
        inherit (scripts) flushdns;
      };
    };
}
