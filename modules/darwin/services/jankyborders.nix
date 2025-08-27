{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  config = lib.mkIf cfg.enable {
    services.jankyborders = {
      enable = true;
      inactive_color = "0xFF000000";
      width = 1.0;
    };
  };
}
