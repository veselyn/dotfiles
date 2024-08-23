inputs: let
  mkConfiguration = import ../mk-configuration.nix inputs;
in
  mkConfiguration rec {
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
        nix.settings.experimental-features = ["nix-command" "flakes"];
        nixpkgs = inputs.self.lib.pkgsConfig {};

        users.users = {
          veselin = {
            extraGroups = ["wheel"];
            hashedPasswordFile = config.age.secrets.veselinPassword.path;
            isNormalUser = true;
            openssh.authorizedKeys.keys = with lib.own.sshKeys; [master];
          };
        };

        services = {
          openssh.enable = true;

          tailscale = {
            enable = true;
            authKeyFile = config.age.secrets.tailscaleAuthKey.path;
          };
        };

        services.home-assistant = {
          enable = true;
          openFirewall = true;
          config = {};
        };

        networking.wireless = {
          enable = true;
          userControlled.enable = true;
        };
        systemd.services.wpa_supplicant.wantedBy = lib.mkOverride 50 [];

        networking.hostName = hostName;

        system.stateVersion = "24.05";
      })
    ];
  }
