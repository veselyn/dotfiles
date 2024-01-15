inputs: let
  mkConfiguration = import ../mk-configuration.nix inputs;
in
  mkConfiguration {
    system = "aarch64-darwin";
    hostName = "veselins-macbook-pro";
    user = "veselin";
  }
