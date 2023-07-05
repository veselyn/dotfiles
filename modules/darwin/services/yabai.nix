_: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      layout = "bsp";
      left_padding = 5;
      bottom_padding = 5;
      top_padding = 5;
      right_padding = 5;
      window_gap = 5;
      mouse_follows_focus = "on";
      window_origin_display = "focused";
      window_shadow = "off";
      window_border = "on";
      window_border_blur = "off";
      window_border_width = 1;
      active_window_border_color = "0xffffffff";
      normal_window_border_color = "0x00000000";
    };
  };
}
