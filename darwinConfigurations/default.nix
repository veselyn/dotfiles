{
  darwin,
  home-manager,
  ...
} @ inputs: let
  mkConfiguration = {
    system,
    user,
    baseModules ? [
      ../modules/darwin
      {modules.darwin.user = user;}
      home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;

          extraSpecialArgs = {inherit inputs;};

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

      specialArgs = {inherit inputs;};

      modules = baseModules ++ extraModules;
    };
in {
  veselins-macbook-pro = mkConfiguration {
    system = "aarch64-darwin";
    user = "veselin";
  };
}
