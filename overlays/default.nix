{ self, ... }:

{
  scripts = final: prev:
    let packages = self.packages.${prev.system}; in {
      scripts = {
        inherit (packages) battery;
        inherit (packages) flushdns;
      };
    };
}
