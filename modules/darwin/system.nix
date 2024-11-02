{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  config = lib.mkIf cfg.enable {
    system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;
    system.defaults.NSGlobalDomain."com.apple.keyboard.fnState" = true;
    system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
    system.defaults.NSGlobalDomain.AppleKeyboardUIMode = 3;
    system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
    system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;
    system.defaults.NSGlobalDomain.KeyRepeat = 2;
    system.defaults.NSGlobalDomain.NSWindowShouldDragOnGesture = true;
    system.defaults.NSGlobalDomain._HIHideMenuBar = true;
    system.defaults.alf.globalstate = 1;
    system.defaults.dock.autohide = true;
    system.defaults.dock.mru-spaces = false;
    system.defaults.dock.tilesize = 16;
    system.defaults.universalaccess.closeViewScrollWheelToggle = true;
    system.defaults.universalaccess.closeViewZoomFollowsFocus = true;
    system.defaults.universalaccess.reduceMotion = true;
    system.keyboard.enableKeyMapping = true;
    system.keyboard.remapCapsLockToEscape = true;
  };
}
