{self, ...}: {
  flake.homeConfigurations."veselin@macbook-pro" = self.lib.mkHome {
    system = "aarch64-darwin";
    username = "veselin";
  };
}
