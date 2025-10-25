{
  inputs,
  self,
  ...
}: {
  imports = [
    ./gitpick
    ./opsh
    ./smux
    ./wmctl
  ];

  perSystem = {system, ...}: {
    _module.args.pkgs = self.lib.mkPkgs inputs.nixpkgs {
      inherit system;
      overlays = builtins.attrValues self.overlays;
    };
  };
}
