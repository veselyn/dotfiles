_: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      layout = "bsp";
      left_padding = 1;
      bottom_padding = 1;
      top_padding = 1;
      right_padding = 1;
      window_gap = 1;
      mouse_follows_focus = "on";
      window_origin_display = "focused";
      window_shadow = "on";
      insert_feedback_color = "0xffffffff";
    };
  };
}
