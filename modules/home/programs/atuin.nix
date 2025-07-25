{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.atuin = {
      enable = true;
      daemon.enable = true;
      flags = ["--disable-up-arrow"];
      settings = {
        dotfiles.enabled = true;
      };
    };
  };
}
