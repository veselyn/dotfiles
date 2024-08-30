_: {
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      hide_window_decorations = "titlebar-only";
      macos_option_as_alt = "both";
      mouse_hide_wait = -1;
    };

    shellIntegration.mode = "no-cursor";
  };
}
