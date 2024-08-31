inputs: let
  mkConfiguration = import ../mk-configuration.nix inputs;
in
  mkConfiguration rec {
    nixpkgs = inputs.nixpkgs-stable;
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

        programs = {
          git.enable = true;
          neovim.defaultEditor = true;
          neovim.enable = true;
          neovim.viAlias = true;
          neovim.vimAlias = true;
          tmux.enable = true;
        };

        services = {
          openssh.enable = true;

          tailscale = {
            enable = true;
            authKeyFile = config.age.secrets.tailscaleAuthKey.path;
          };
        };

        services.nginx = {
          enable = true;
          virtualHosts = {
            "_" = {
              default = true;
              locations."/" = {
                return = 404;
              };
            };
          };
        };

        virtualisation.oci-containers = {
          containers = {
            home-assistant = {
              image = "ghcr.io/home-assistant/home-assistant:stable";
              ports = ["8123:8123"];
              volumes = [
                "home-assistant:/config"
              ];
              extraOptions = [
                "--network=host"

                (let
                  device = "/dev/serial/by-id/usb-Nabu_Casa_SkyConnect_v1.0_fce2eeb67c9bed11a28105bfa7669f5d-if00-port0";
                in "--device=${device}:${device}")
              ];
            };
          };
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
