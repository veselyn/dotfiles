{
  config,
  lib,
  toplevel,
  ...
}: let
  cfg = config.self.modules.nixos.home;
in {
  imports = [
    toplevel.inputs.home-manager.nixosModules.home-manager
    toplevel.self.modules.generic.home
  ];

  options = {
    self.modules.nixos.home = lib.mkOption {
      type = lib.types.attrs;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${cfg.username} = {
      imports = [toplevel.self.modules.home.linux];
      self.modules.home = cfg;
    };
  };
}
