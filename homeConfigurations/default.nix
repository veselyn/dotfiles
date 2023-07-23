{
  home-manager,
  nixpkgs,
  self,
  ...
}: {
  "veselin" = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      system = "aarch64-darwin";
      overlays = builtins.attrValues self.overlays;
    };

    modules = [
      {
        imports = [
          ../modules/home
        ];

        home = {
          username = "veselin";
          homeDirectory = "/Users/veselin";
        };
      }
    ];
  };
}
