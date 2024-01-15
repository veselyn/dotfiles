{
  darwin,
  home-manager,
  ...
} @ inputs: {
  system,
  hostName,
  user,
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
        imports = extraHomeModules;
        inherit user;
      };
    }
    ../modules/common
  ],
  extraModules ? [],
  extraHomeModules ? [],
}:
darwin.lib.darwinSystem {
  inherit system;

  specialArgs = specialArgs // extraArgs;

  modules = baseModules ++ extraModules;
}
