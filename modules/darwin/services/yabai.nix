{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  config = lib.mkIf cfg.enable {
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
        window_shadow = "off";
        insert_feedback_color = "0xffffffff";
      };
      extraConfig = ''
        yabai -m signal --add event=dock_did_restart action='sudo yabai --load-sa'
        sudo yabai --load-sa
      '';
    };
  };
}
