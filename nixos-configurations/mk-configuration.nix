{
  home-manager,
  nixpkgs,
  ...
} @ inputs: {
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
}
