{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  imports = [
    ./skhd.nix
    ./yabai.nix
  ];

  config = lib.mkIf cfg.enable {
    services = {
      dnsmasq.enable = true;
    };
  };
}
