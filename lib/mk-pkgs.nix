{self, ...}: nixpkgs: system: overrides:
import nixpkgs (self.lib.pkgsConfig ({inherit system;} // overrides))
