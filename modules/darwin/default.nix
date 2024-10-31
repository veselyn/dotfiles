{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  options = {
    self.modules.darwin = {
      enable = lib.mkEnableOption "darwin";
    };
  };

  config = lib.mkIf cfg.enable {
    services.nix-daemon.enable = true;
    system.stateVersion = 5;
  };
}
