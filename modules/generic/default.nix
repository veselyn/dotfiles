{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.generic;
in {
  options = {
    self.modules.generic = {
      enable = lib.mkEnableOption "generic";
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;
  };
}
