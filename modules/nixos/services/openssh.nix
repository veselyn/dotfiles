{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.nixos;
in {
  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;

      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
  };
}
