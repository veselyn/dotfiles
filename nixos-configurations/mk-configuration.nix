{
  home-manager,
  nixpkgs,
  ...
} @ inputs: {
  system,
  hostName,
  user,
  specialArgs ? {inherit inputs;},
  extraArgs ? {},
  baseModules ? [
    ../modules/nixos
    {
      modules.nixos = {
        inherit hostName;
        inherit user;
      };
    }
    home-manager.nixosModules.home-manager
    ../modules/home/linux
    {
      modules.home = {
        imports = extraHomeModules;
        inherit user;
      };
    }
    ../modules/common
  ],
  extraModules ? [],
  extraHomeModules ? [],
}:
nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = specialArgs // extraArgs;

  modules = baseModules ++ extraModules;
}
