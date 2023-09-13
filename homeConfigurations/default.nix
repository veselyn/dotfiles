{
  home-manager,
  nixpkgs,
  self,
  ...
} @ inputs: let
  mkConfiguration = {
    system,
    user,
    baseModules ? [
      ../modules/home
      {modules.home.user = user;}
      ../modules/common
    ],
    extraModules ? [],
  }:
    home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        overlays = builtins.attrValues self.overlays;
        config.allowUnfree = true;
      };

      extraSpecialArgs = {inherit inputs;};

      modules = baseModules ++ extraModules;
    };
in {
  "veselin@aarch64-darwin" = mkConfiguration {
    system = "aarch64-darwin";
    user = "veselin";
  };
  "veselin@aarch64-linux" = mkConfiguration {
    system = "aarch64-linux";
    user = "veselin";
  };
}
