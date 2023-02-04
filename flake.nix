{
  description = "dotfiles";

  inputs = {
    darwin.url = "github:lnl7/nix-darwin";
  };

  outputs = { darwin, ... }: {
    darwinConfigurations = {
      veselins-macbook-pro = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./config/nixpkgs/darwin/configuration.nix
        ];
      };
    };
  };
}
