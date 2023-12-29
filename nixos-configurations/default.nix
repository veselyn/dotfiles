inputs: let
  mkConfiguration = import ./mk-configuration.nix inputs;
in {
  veselins-macbook-pro = mkConfiguration {
    system = "aarch64-linux";
    user = "veselin";
    extraModules = [./veselins-macbook-pro.nix];
  };
}
