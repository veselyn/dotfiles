{
  inputs,
  self,
  ...
}: {
  imports = [
    ./gitpick
    ./yabaictl
  ];

  perSystem = {system, ...}: {
    _module.args.pkgs = self.lib.mkPkgs inputs.nixpkgs {
      inherit system;
      overlays = builtins.attrValues self.overlays;
    };
  };
}
