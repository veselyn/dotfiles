{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.nixos;
in {
  config = lib.mkIf cfg.enable {
    documentation = {
      man.generateCaches = true;
    };
  };
}
