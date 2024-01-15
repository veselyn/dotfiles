{config, ...}: let
  cfg = config.modules.darwin;
in {
  networking = {
    inherit (cfg) hostName;
  };
}
