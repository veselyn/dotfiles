{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;
in {
  options = {
    self.modules.home = {
      enable = lib.mkEnableOption "home";

      username = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.username = cfg.username;
    home.homeDirectory = let
      directory =
        if pkgs.stdenv.isDarwin
        then "/Users"
        else "/home";
    in "${directory}/${cfg.username}";

    programs.home-manager.enable = true;
    home.stateVersion = "24.11";
  };
}
