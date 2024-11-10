{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.nixos;
in {
  imports = [
    ./openssh.nix
  ];

  config = lib.mkIf cfg.enable {
    services = {
    };
  };
}
