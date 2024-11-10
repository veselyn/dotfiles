{inputs, ...}: let
  mkPkgs = nixpkgs: system:
    import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
in {
  flake.overlays = {
    default = final: _prev: {
      unstable = mkPkgs inputs.nixpkgs final.system;
      stable = mkPkgs inputs.nixpkgs-stable final.system;
      master = mkPkgs inputs.nixpkgs-master final.system;
    };
  };
}
