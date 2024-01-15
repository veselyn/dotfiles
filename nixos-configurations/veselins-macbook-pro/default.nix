inputs: let
  mkConfiguration = import ../mk-configuration.nix inputs;
in
  mkConfiguration {
    system = "aarch64-linux";
    hostName = "veselins-macbook-pro";
    user = "veselin";
    extraModules = [./hardware.nix];
  }
