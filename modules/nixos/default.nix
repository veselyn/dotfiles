{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.nixos;
in {
  imports = [
  ];

  options = {
    self.modules.nixos = {
      enable = lib.mkEnableOption "nixos";
    };
  };

  config = lib.mkIf cfg.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    system.stateVersion = "24.11";
  };
}
