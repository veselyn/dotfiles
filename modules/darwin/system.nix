{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  config = lib.mkIf cfg.enable {
    system = {
      defaults = {
        ".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;

        NSGlobalDomain = {
          "com.apple.keyboard.fnState" = true;
          AppleInterfaceStyleSwitchesAutomatically = true;
          AppleKeyboardUIMode = 3;
          ApplePressAndHoldEnabled = false;
          InitialKeyRepeat = 15;
          KeyRepeat = 2;
          NSWindowShouldDragOnGesture = true;
          _HIHideMenuBar = true;
        };

        alf.globalstate = 1;

        dock = {
          autohide = true;
          mru-spaces = false;
          tilesize = 16;
        };

        magicmouse.MouseButtonMode = "TwoButton";

        universalaccess = {
          closeViewScrollWheelToggle = true;
          closeViewZoomFollowsFocus = true;
          reduceMotion = true;
        };
      };

      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToEscape = true;
      };
    };
  };
}
