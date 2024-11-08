{
  config,
  lib,
  toplevel,
  ...
}: let
  cfg = config.self.modules.darwin.home;
in {
  imports = [
    toplevel.inputs.home-manager.darwinModules.home-manager
    toplevel.self.modules.generic.home
  ];

  options = {
    self.modules.darwin.home = lib.mkOption {
      type = lib.types.attrs;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${cfg.username} = {
      imports = [toplevel.self.modules.home.darwin];
      self.modules.home = cfg;
    };
  };
}
