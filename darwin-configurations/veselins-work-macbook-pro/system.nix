{lib, ...}: {
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
        AppleShowAllExtensions = true;
        AppleShowAllFiles = false;
        CreateDesktop = true;
        FXDefaultSearchScope = null;
        FXEnableExtensionChangeWarning = true;
        FXPreferredViewStyle = "Nlsv";
        QuitMenuItem = false;
        ShowPathbar = true;
        ShowStatusBar = false;
        _FXShowPosixPathInTitle = false;
      };

      magicmouse.MouseButtonMode = "TwoButton";

      spaces.spans-displays = false;

      universalaccess = lib.mkForce {
        closeViewScrollWheelToggle = true;
        closeViewZoomFollowsFocus = true;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      nonUS.remapTilde = true;
      remapCapsLockToEscape = true;
    };
  };
}
