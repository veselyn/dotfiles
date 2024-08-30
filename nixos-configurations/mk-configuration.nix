{
  agenix,
  home-manager,
  ...
} @ inputs: {
  nixpkgs ? inputs.nixpkgs,
  system,
  hostName,
  user ? null,
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
        imports =
          [
            agenix.homeManagerModules.age
            ../modules/agenix
            ../modules/secrets
          ]
          ++ extraHomeModules;
        inherit user;
      };
    }
    agenix.nixosModules.age
    ../modules/agenix
    ../modules/secrets
    ../modules/common
    {modules.common.nixpkgs = nixpkgs;}
  ],
  extraModules ? [],
  extraHomeModules ? [],
}:
nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = specialArgs // extraArgs;

  modules = baseModules ++ extraModules;
}
