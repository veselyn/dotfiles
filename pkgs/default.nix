{
  inputs,
  self,
  ...
}: {
  imports = [
    ./appearance
    ./gitpick
    ./smux
    ./yabaictl
  ];

  perSystem = {system, ...}: {
    _module.args.pkgs = self.lib.mkPkgs inputs.nixpkgs {
      inherit system;
      overlays = builtins.attrValues self.overlays;
    };
  };
}
