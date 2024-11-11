{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;
in {
  imports = [
    ./1password.nix
    ./docker.nix
    ./packages.nix
    ./programs
    ./shellAliases.nix
    ./xdg.nix
  ];

  options = {
    self.modules.home = {
      enable = lib.mkEnableOption "home";

      username = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      inherit (cfg) username;
      homeDirectory = let
        directory =
          if pkgs.stdenv.isDarwin
          then "/Users"
          else "/home";
      in "${directory}/${cfg.username}";
    };

    programs.home-manager.enable = true;
    home.stateVersion = "24.11";
  };
}
