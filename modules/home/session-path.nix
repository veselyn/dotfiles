{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    home.sessionPath = [
      "$HOME/.local/bin"
    ];
  };
}
