{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    services = {
      gpg-agent.enable = true;
      ssh-agent.enable = true;
    };
  };
}
