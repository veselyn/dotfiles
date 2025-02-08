{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.nixos;
in {
  config = lib.mkIf cfg.enable {
    virtualisation = {
      podman.enable = true;
    };
  };
}
