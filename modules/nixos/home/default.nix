{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.self.modules.nixos.home;
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.self.modules.generic.home
  ];

  options = {
    self.modules.nixos.home = lib.mkOption {
      type = lib.types.attrs;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${cfg.username} = {
      imports = [inputs.self.modules.home.linux];
      self.modules.home = cfg;
    };
  };
}
