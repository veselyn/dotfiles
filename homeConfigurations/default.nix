{
  home-manager,
  nixpkgs,
  self,
  ...
} @ inputs: {
  "veselin" = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      system = "aarch64-darwin";
      overlays = builtins.attrValues self.overlays;
    };

    extraSpecialArgs = {inherit inputs;};

    modules = [
      ../modules/home
      {
        home = {
          username = "veselin";
          homeDirectory = "/Users/veselin";
        };
      }
    ];
  };
}
