{
  home-manager,
  nixpkgs,
  ...
} @ inputs: let
  mkConfiguration = {
    system,
    user,
    specialArgs ? {inherit inputs;},
    extraArgs ? {},
    baseModules ? [
      ../modules/nixos
      {modules.nixos.user = user;}
      home-manager.nixosModules.home-manager
      ../modules/home/linux
      {modules.home.user = user;}
      ../modules/common
    ],
    extraModules ? [],
  }:
    nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = specialArgs // extraArgs;

      modules = baseModules ++ extraModules;
    };
in {
  veselins-macbook-pro = mkConfiguration {
    system = "aarch64-linux";
    user = "veselin";
  };
}
