{
  config,
  lib,
  options,
  ...
}: {
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = "Mod1";
      terminal = "kitty";

      keybindings = let
        inherit (config.xsession.windowManager.i3.config) modifier;
      in
        lib.mkOptionDefault {
          "${modifier}+Shift+j" = "move left";
          "${modifier}+Shift+k" = "move down";
          "${modifier}+Shift+l" = "move up";
          "${modifier}+Shift+semicolon" = "move right";
          "${modifier}+j" = "focus left";
          "${modifier}+k" = "focus down";
          "${modifier}+l" = "focus up";
          "${modifier}+semicolon" = "focus right";
        };

      modes = lib.mkOptionDefault {
        resize = {
          j = "resize shrink width 10 px or 10 ppt";
          k = "resize grow height 10 px or 10 ppt";
          l = "resize shrink height 10 px or 10 ppt";
          semicolon = "resize grow width 10 px or 10 ppt";
        };
      };

      fonts.size = 11.0;

      bars = let
        default = (options.xsession.windowManager.i3.config.type.getSubOptions {}).bars.default;
      in
        [(builtins.head default // {fonts.size = 11.0;})] ++ builtins.tail default;
    };
  };
}
