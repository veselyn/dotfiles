{
  agenix,
  home-manager,
  self,
  ...
} @ inputs: {
  nixpkgs ? inputs.nixpkgs,
  system,
  user ? null,
  specialArgs ? {inherit inputs;},
  extraArgs ? {},
  baseModules ? [
    ../modules/home/standalone
    {modules.home.user = user;}
    agenix.nixosModules.age
    ../modules/agenix
    ../modules/secrets
    ../modules/common
    {modules.common.nixpkgs = nixpkgs;}
  ],
  extraModules ? [],
}:
home-manager.lib.homeManagerConfiguration {
  pkgs = self.lib.mkPkgs nixpkgs system {};

  extraSpecialArgs = specialArgs // extraArgs;

  modules = baseModules ++ extraModules;
}
