{config, ...}: let
  cfg = config.modules.nixos;
in {
  networking = {
    inherit (cfg) hostName;
  };
}
