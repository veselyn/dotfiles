{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  config = lib.mkIf cfg.enable {
    nix = {
      linux-builder = {
        enable = true;
        config = {
          virtualisation = {
            cores = 1;
            darwin-builder.diskSize = 20 * 1024;
            darwin-builder.memorySize = 3 * 1024;
          };
        };
      };
    };
  };
}
