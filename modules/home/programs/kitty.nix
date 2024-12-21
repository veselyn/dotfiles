{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      shellIntegration.mode = "no-cursor";

      settings = {
        confirm_os_window_close = 0;
        dynamic_background_opacity = true;
        enable_audio_bell = false;
        hide_window_decorations = "titlebar-only";
        macos_option_as_alt = "both";
        mouse_hide_wait = -1;
        tab_bar_style = "hidden";
      };

      keybindings = {
        "super+f" = "select_tab";
      };

      extraConfig = ''
        include theme.conf
      '';
    };
  };
}
