{self, ...}: {
  flake.nixosConfigurations."nixos-vm" = self.lib.mkNixOS {
    system = "aarch64-linux";

    modules = [
      ./hardware.nix
    ];
  };
}
