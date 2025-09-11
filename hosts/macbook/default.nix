{self, ...}: {
  flake.darwinConfigurations."macbook" = self.lib.mkDarwin {
    hostname = "macbook";
    system = "aarch64-darwin";
    username = "veselin";
  };
}
