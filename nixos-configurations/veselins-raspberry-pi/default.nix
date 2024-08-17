inputs: let
  mkConfiguration = import ../mk-configuration.nix inputs;
in
  mkConfiguration {
    system = "aarch64-linux";
    hostName = "veselins-raspberry-pi";
    baseModules = [];
    extraModules = [
      inputs.raspberry-pi.nixosModules.raspberry-pi

      (_: {
        raspberry-pi-nix.board = "bcm2712";
      })

      ({lib, ...}:
        with lib; {
          users.users = {
            veselin = {
              extraGroups = ["wheel"];
              hashedPassword = "$y$j9T$sIqju9VgjcLyOFscy3B8B1$UzUfQf9aAyFeHH0.GfsbIJR3.U.Kg0AATf4E50nsz08";
              isNormalUser = true;
              openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJBKvLCEwUG+hT5G0PFIHLPJK/rM8EiPngEkAkvLmo22"];
            };
          };

          services.openssh.enable = true;

          networking.wireless = {
            enable = true;
            userControlled.enable = true;
          };
          systemd.services.wpa_supplicant.wantedBy = mkOverride 50 [];

          system.stateVersion = "24.05";
        })
    ];
  }
