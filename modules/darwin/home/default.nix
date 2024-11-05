{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin.home;
in {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    inputs.self.modules.generic.home
  ];

  options = {
    self.modules.darwin.home = lib.mkOption {
      type = lib.types.attrs;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${cfg.username} = {
      imports = [inputs.self.modules.home.darwin];
      self.modules.home = cfg;
    };
  };
}
