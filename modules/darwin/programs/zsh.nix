{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      promptInit = "";
      enableGlobalCompInit = false;
    };
  };
}
