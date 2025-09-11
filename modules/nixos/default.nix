{
  config,
  lib,
  pkgs,
  toplevel,
  ...
}: let
  cfg = config.self.modules.nixos;
in {
  imports = [
    ./documentation.nix
    ./services
    ./virtualisation
    toplevel.inputs.disko.nixosModules.disko
    toplevel.inputs.nixos-generators.nixosModules.all-formats
  ];

  options = {
    self.modules.nixos = {
      enable = lib.mkEnableOption "nixos";

      username = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.username} = {
      extraGroups = ["wheel"];
      hashedPassword = "$y$j9T$PeH7qw8mng473jD.vm154/$QAA7tdfQUrw1BdBrXjOX/hegKBsn0IW6FJRK4I43qOA";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [toplevel.self.keys.ssh.master];
      shell = pkgs.zsh;
    };

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    programs.zsh.enable = true;
    system.stateVersion = "25.11";
  };
}
