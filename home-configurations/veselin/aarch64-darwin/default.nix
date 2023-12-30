inputs: let
  mkConfiguration = import ../../mk-configuration.nix inputs;
in
  mkConfiguration {
    system = "aarch64-darwin";
    user = "veselin";
  }
