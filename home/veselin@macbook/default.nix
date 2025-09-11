{self, ...}: {
  flake.homeConfigurations."veselin@macbook" = self.lib.mkHome {
    system = "aarch64-darwin";
    username = "veselin";
  };
}
