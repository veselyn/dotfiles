_: {
  programs.kitty = {
    enable = true;

    font = {
      name = "MesloLGS Nerd Font";
      size = 13;
    };

    settings = {
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      hide_window_decorations = "titlebar-only";
      macos_option_as_alt = "both";
      mouse_hide_wait = -1;
    };
  };
}
