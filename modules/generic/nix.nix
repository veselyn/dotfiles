{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.generic;
in {
  config = lib.mkIf cfg.enable {
    nix = {
      gc = {
        automatic = true;
        options = "--delete-older-than 30d";
      };
    };
  };
}
