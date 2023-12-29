inputs: let
  mkConfiguration = import ./mk-configuration.nix inputs;
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
