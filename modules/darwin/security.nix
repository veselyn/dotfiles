{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  config = lib.mkIf cfg.enable {
    security.pam.services.sudo_local = {
      reattach = true;
      touchIdAuth = true;
      watchIdAuth = true;
    };
  };
}
