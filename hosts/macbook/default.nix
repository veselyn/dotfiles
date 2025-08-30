{self, ...}: {
  flake.darwinConfigurations."macbook" = self.lib.mkDarwin {
    system = "aarch64-darwin";
    username = "veselin";
  };
}
