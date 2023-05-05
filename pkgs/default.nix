{
  lib,
  pkgs,
}:
lib.makeScope pkgs.newScope (self:
    with self; {
      battery = callPackage ./battery {};
      flushdns = callPackage ./flushdns {};
      yabaictl = callPackage ./yabaictl {};

      yabai = callPackage ./yabai {
        inherit (darwin.apple_sdk_11_0.frameworks) SkyLight Cocoa Carbon ScriptingBridge;
      };
    })
