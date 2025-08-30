{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  config = lib.mkIf cfg.enable {
    nix = {
      linux-builder.enable = true;
    };
  };
}
