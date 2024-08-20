inputs: let
  mkConfiguration = import ../mk-configuration.nix inputs;
in
  mkConfiguration {
    system = "aarch64-linux";
    hostName = "veselins-raspberry-pi";
    baseModules = [];
    extraModules = [
      ./hardware.nix

      ./secrets

      ({
        pkgs,
        config,
        ...
      }: let
        inherit (pkgs) lib;
      in {
        nixpkgs = inputs.self.lib.pkgsConfig {};

        users.users = {
          veselin = {
            extraGroups = ["wheel"];
            hashedPassword = "$y$j9T$sIqju9VgjcLyOFscy3B8B1$UzUfQf9aAyFeHH0.GfsbIJR3.U.Kg0AATf4E50nsz08";
            isNormalUser = true;
            openssh.authorizedKeys.keys = with lib.own.sshKeys; [master];
          };
        };

        services.openssh.enable = true;

        networking.wireless = {
          enable = true;
          userControlled.enable = true;
        };
        systemd.services.wpa_supplicant.wantedBy = lib.mkOverride 50 [];

        system.stateVersion = "24.05";
      })
    ];
  }
