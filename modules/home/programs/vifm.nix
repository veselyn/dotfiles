{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.vifm = {
      enable = true;
      extraConfig = ''
        only
      '';
    };
  };
}
