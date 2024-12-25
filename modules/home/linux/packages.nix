{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;

  others = builtins.attrValues {
    inherit
      (pkgs)
      _1password-gui
      ;
  };
in {
  config = lib.mkIf cfg.enable {
    home.packages = others;
  };
}
