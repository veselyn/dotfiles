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
    virtualisation.vmware.guest.enable = true;
  };
}
