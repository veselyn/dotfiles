inputs: let
  mkConfiguration = import ../mk-configuration.nix inputs;
in
  mkConfiguration {
    system = "aarch64-linux";
    user = "veselin";
    extraModules = [./hardware.nix];
  }
