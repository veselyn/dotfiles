{raspberry-pi-nix, ...} @ inputs: let
  mkConfiguration = import ../mk-configuration.nix inputs;
in
  mkConfiguration {
    system = "aarch64-linux";
    hostName = "veselins-raspberry-pi";
    user = "veselin";
    extraModules = [raspberry-pi-nix.nixosModules.raspberry-pi (_:{
        raspberry-pi-nix.board = "bcm2712";
    })];
  }
