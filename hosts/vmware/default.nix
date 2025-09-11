{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations."vmware" = self.lib.mkNixOS {
    system = "aarch64-linux";
    username = "veselin";

    modules = [
      inputs.nixos-generators.nixosModules.vmware
    ];
  };
}
