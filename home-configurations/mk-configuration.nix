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
  pkgs = import nixpkgs {
    inherit system;
    overlays = builtins.attrValues self.overlays;
    config.allowUnfree = true;
  };

  extraSpecialArgs = specialArgs // extraArgs;

  modules = baseModules ++ extraModules;
}
