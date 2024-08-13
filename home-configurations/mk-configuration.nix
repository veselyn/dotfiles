{
  home-manager,
  nixpkgs,
  self,
  ...
} @ inputs: {
  system,
  user,
  specialArgs ? {inherit inputs;},
  extraArgs ? {},
  baseModules ? [
    ../modules/home/standalone
    {modules.home.user = user;}
    ../modules/common
  ],
  extraModules ? [],
}:
home-manager.lib.homeManagerConfiguration {
  pkgs = self.lib.mkPkgs nixpkgs system {};

  extraSpecialArgs = specialArgs // extraArgs;

  modules = baseModules ++ extraModules;
}
