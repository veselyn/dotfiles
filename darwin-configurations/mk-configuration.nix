{
  darwin,
  home-manager,
  ...
} @ inputs: {
  system,
  user,
  specialArgs ? {inherit inputs;},
  extraArgs ? {},
  baseModules ? [
    ../modules/darwin
    {modules.darwin.user = user;}
    home-manager.darwinModules.home-manager
    ../modules/home/darwin
    {modules.home.user = user;}
    ../modules/common
  ],
  extraModules ? [],
}:
darwin.lib.darwinSystem {
  inherit system;

  specialArgs = specialArgs // extraArgs;

  modules = baseModules ++ extraModules;
}