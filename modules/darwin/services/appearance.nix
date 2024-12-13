{
  config,
  lib,
  perSystem,
  pkgs,
  ...
}: let
  cfg = config.self.modules.darwin;
  user = config.users.users.${cfg.username};
in {
  config = lib.mkIf cfg.enable {
    launchd.user.agents.appearance = {
      command = "dark-mode-notify appearance";
      path = builtins.attrValues {
        inherit (pkgs) dark-mode-notify;
        inherit (perSystem.self'.packages) appearance;
      };
      serviceConfig = {
        KeepAlive = true;
        StandardOutPath = "${user.home}/Library/Logs/appearance/log";
        StandardErrorPath = "${user.home}/Library/Logs/appearance/log";
      };
    };
  };
}
