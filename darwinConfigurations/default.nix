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
      home-manager.darwinModules.home-manager
      {
        users.users.veselin = {
          name = "veselin";
          home = "/Users/veselin";
        };

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.veselin = {
            imports = [../modules/home-manager];

            home = {
              username = "veselin";
              homeDirectory = "/Users/veselin";
            };
          };
        };
      }
    ];
  };
}
