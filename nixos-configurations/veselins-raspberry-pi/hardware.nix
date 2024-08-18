{inputs, ...}: {
  imports = [
    inputs.raspberry-pi.nixosModules.raspberry-pi
  ];

  raspberry-pi-nix.board = "bcm2712";
}
