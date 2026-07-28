{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;

  inherit (pkgs) fd;
in {
  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      changeDirWidget.command = "${fd}/bin/fd --type d";
      defaultCommand = "${fd}/bin/fd --type f";
      fileWidget.command = "${fd}/bin/fd --type f";
      historyWidget.command = "";
      tmux.enableShellIntegration = true;
    };
  };
}
