{
  home-manager,
  nixpkgs,
  ...
} @ inputs: let
  mkConfiguration = {
    system,
    user,
    baseModules ? [
      ../modules/nixos
      {modules.nixos.user = user;}
      home-manager.nixosModules.home-manager
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
    nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {inherit inputs;};

      modules = baseModules ++ extraModules;
    };
in {
  veselins-macbook-pro = mkConfiguration {
    system = "aarch64-linux";
    user = "veselin";
  };
}
