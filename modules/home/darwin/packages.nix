{
  config,
  lib,
  perSystem,
  ...
}: let
  cfg = config.self.modules.home;

  self = builtins.attrValues {
    inherit
      (perSystem.self'.packages)
      yabaictl
      ;
  };
in {
  config = lib.mkIf cfg.enable {
    home.packages = self;
  };
}
