{self, ...}: nixpkgs: system: args:
import nixpkgs ({
    inherit system;
    overlays = builtins.attrValues self.overlays;
    config.allowUnfree = true;
  }
  // args)
