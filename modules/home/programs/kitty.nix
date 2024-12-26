{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;

  mkThemePath = theme: "${pkgs.kitty-themes}/share/kitty-themes/themes/${theme}.conf";
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
    };

    xdg.configFile = {
      "kitty/dark-theme.auto.conf".source = mkThemePath "Default";
      "kitty/light-theme.auto.conf".source = mkThemePath "CLRS";
      "kitty/no-preference-theme.auto.conf".source = mkThemePath "Default";
    };
  };
}
