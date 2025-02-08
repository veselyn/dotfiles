{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.nixos;
in {
  options = {
    self.modules.nixos = {
      vmware = {
        enable = lib.mkEnableOption "vmware";
      };
    };
  };

  config = lib.mkIf (cfg.enable && cfg.vmware.enable) {
    networking.firewall.enable = false;
    virtualisation.vmware.guest.enable = true;
  };
}
