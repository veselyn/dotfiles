{
  home-manager,
  nixpkgs,
  self,
  ...
} @ inputs: {
  "veselin@aarch64-darwin" = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      system = "aarch64-darwin";
      overlays = builtins.attrValues self.overlays;
      config.allowUnfree = true;
    };

    extraSpecialArgs = {inherit inputs;};

    modules = [
      ../modules/home
      {modules.home.user = "veselin";}
    ];
  };
}
