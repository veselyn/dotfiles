{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.delta = {
      enable = true;
      options = {
        diff-so-fancy = true;
      };
    };
  };
}
