{
  agenix,
  darwin,
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
    ../modules/darwin
    {
      modules.darwin = {
        inherit hostName;
        inherit user;
      };
    }
    home-manager.darwinModules.home-manager
    ../modules/home/darwin
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
    agenix.darwinModules.age
    ../modules/agenix
    ../modules/secrets
    ../modules/common
    {modules.common.nixpkgs = nixpkgs;}
  ],
  extraModules ? [],
  extraHomeModules ? [],
}:
darwin.lib.darwinSystem {
  inherit system;

  specialArgs = specialArgs // extraArgs;

  modules = [{nixpkgs.source = nixpkgs;}] ++ baseModules ++ extraModules;
}
