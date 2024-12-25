{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.nixos;
in {
  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.windowManager.i3.enable = true;
  };
}
