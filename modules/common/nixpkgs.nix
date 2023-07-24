{inputs, ...}: {
  nixpkgs = {
    overlays = builtins.attrValues inputs.self.overlays;
    config.allowUnfree = true;
  };
}
