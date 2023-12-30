inputs: let
  mkConfiguration = import ../mk-configuration.nix inputs;
in
  mkConfiguration {
    system = "aarch64-linux";
    user = "veselin";
    extraModules = [./veselins-macbook-pro.nix];
  }
