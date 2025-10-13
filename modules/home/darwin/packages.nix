{
  config,
  lib,
  perSystem,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;

  self = builtins.attrValues {
    inherit
      (pkgs)
      iproute2mac
      ;
    inherit
      (perSystem.self'.packages)
      wmctl
      ;
  };
in {
  config = lib.mkIf cfg.enable {
    home.packages = self;
  };
}
