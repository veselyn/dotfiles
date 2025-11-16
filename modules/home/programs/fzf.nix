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
      changeDirWidgetCommand = "${fd}/bin/fd --type d";
      defaultCommand = "${fd}/bin/fd --type f";
      fileWidgetCommand = "${fd}/bin/fd --type f";
      tmux.enableShellIntegration = true;
    };
  };
}
