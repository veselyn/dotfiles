{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  config = lib.mkIf cfg.enable {
    networking = {
      applicationFirewall.enable = true;
    };
  };
}
