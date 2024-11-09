{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  imports = [
    ./homebrew.nix
    ./programs
    ./services
    ./system.nix
  ];

  options = {
    self.modules.darwin = {
      enable = lib.mkEnableOption "darwin";

      username = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.username} = {
      name = cfg.username;
      home = "/Users/${cfg.username}";
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJBKvLCEwUG+hT5G0PFIHLPJK/rM8EiPngEkAkvLmo22"];
    };

    services.nix-daemon.enable = true;
    system.stateVersion = 5;
  };
}
