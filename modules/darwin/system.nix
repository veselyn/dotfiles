_: {
  system = {
    defaults = {
      CustomUserPreferences = {
        "com.apple.Accessibility" = {
          ReduceMotionEnabled = 1;
        };
      };

      NSGlobalDomain = {
        "com.apple.keyboard.fnState" = true;
        AppleKeyboardUIMode = 3;
        ApplePressAndHoldEnabled = false;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        _HIHideMenuBar = true;
      };

      dock = {
        autohide = true;
        mru-spaces = false;
        tilesize = 16;
      };

      magicmouse.MouseButtonMode = "TwoButton";

      spaces.spans-displays = false;
    };

    keyboard = {
      enableKeyMapping = true;
      nonUS.remapTilde = true;
      remapCapsLockToEscape = true;
    };
  };
}
