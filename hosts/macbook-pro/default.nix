{self, ...}: {
  flake.darwinConfigurations."macbook-pro" = self.lib.mkDarwin {
    system = "aarch64-darwin";
  };
}
