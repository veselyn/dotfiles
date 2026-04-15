{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      mise.enable = true;
      nix-direnv.enable = true;
    };
  };
}
