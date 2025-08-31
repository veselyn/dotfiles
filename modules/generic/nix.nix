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
        options = "--delete-older-than 10d";
      };
      optimise.automatic = true;
      settings.trusted-users = [cfg.username];
    };
  };
}
