{
  home-manager,
  nixpkgs,
  ...
} @ inputs: {
  veselins-macbook-pro = nixpkgs.lib.nixosSystem {
    system = "aarch64-linux";

    specialArgs = {inherit inputs;};

    modules = [
      ../modules/nixos
      {modules.nixos.user = "veselin";}
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;

          extraSpecialArgs = {inherit inputs;};

          users.veselin = {
            imports = [../modules/home];
            modules.home.user = "veselin";
          };
        };
      }
      ../modules/common
    ];
  };
}
