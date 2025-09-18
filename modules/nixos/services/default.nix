{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.nixos;
in {
  imports = [
    ./openssh.nix
    ./xserver.nix
  ];

  config = lib.mkIf cfg.enable {
    services = {
      automatic-timezoned.enable = true;
      picom.enable = true;
    };
  };
}
