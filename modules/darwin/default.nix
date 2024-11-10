{
  config,
  lib,
  toplevel,
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

      nixpkgs = lib.mkOption {
        type = lib.types.package;
        default = toplevel.inputs.nixpkgs;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.username} = {
      name = cfg.username;
      home = "/Users/${cfg.username}";
      openssh.authorizedKeys.keys = [toplevel.self.keys.ssh.master];
    };

    nixpkgs.source = cfg.nixpkgs;
    nixpkgs.flake.source = cfg.nixpkgs.outPath;

    services.nix-daemon.enable = true;
    system.stateVersion = 5;
  };
}
