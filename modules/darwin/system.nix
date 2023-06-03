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

      finder = {
        AppleShowAllExtensions = false;
        AppleShowAllFiles = false;
        CreateDesktop = true;
        FXDefaultSearchScope = null;
        FXEnableExtensionChangeWarning = true;
        FXPreferredViewStyle = "icnv";
        QuitMenuItem = false;
        ShowPathbar = false;
        ShowStatusBar = false;
        _FXShowPosixPathInTitle = false;
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
