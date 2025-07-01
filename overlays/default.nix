{
  inputs,
  self,
  ...
}: {
  flake.overlays = {
    default = final: _prev: {
      unstable = self.lib.mkPkgs inputs.nixpkgs {inherit (final) system;};
      stable = self.lib.mkPkgs inputs.nixpkgs-stable {inherit (final) system;};
      master = self.lib.mkPkgs inputs.nixpkgs-master {inherit (final) system;};
    };
  };
}
