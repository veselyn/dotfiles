{
  darwin,
  home-manager,
  ...
} @ inputs: let
  mkConfiguration = {
    system,
    user,
    specialArgs ? {inherit inputs;},
    extraArgs ? {},
    baseModules ? [
      ../modules/darwin
      {modules.darwin.user = user;}
      home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;

          extraSpecialArgs = specialArgs // extraArgs;

          users.${user} = {
            imports = [../modules/home];
            modules.home.user = user;
          };
        };
      }
      ../modules/common
    ],
    extraModules ? [],
  }:
    darwin.lib.darwinSystem {
      inherit system;

      specialArgs = specialArgs // extraArgs;

      modules = baseModules ++ extraModules;
    };
in {
  veselins-macbook-pro = mkConfiguration {
    system = "aarch64-darwin";
    user = "veselin";
  };
}
