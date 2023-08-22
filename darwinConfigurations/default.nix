{
  darwin,
  home-manager,
  ...
} @ inputs: {
  veselins-macbook-pro = darwin.lib.darwinSystem {
    system = "aarch64-darwin";

    specialArgs = {inherit inputs;};

    modules = [
      ../modules/darwin
      {modules.darwin.user = "veselin";}
      home-manager.darwinModules.home-manager
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
