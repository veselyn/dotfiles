{self, ...}: {
  flake.nixosConfigurations."vmware" = self.lib.mkNixOS {
    system = "aarch64-linux";
    username = "veselin";

    modules = [
      ./hardware.nix
      {self.modules.nixos.vmware.enable = true;}
    ];
  };
}
