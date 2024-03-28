{
  lib,
  pkgs,
}:
lib.makeScope pkgs.newScope (self:
    with self; {
      battery = callPackage ./battery {};
      flushdns = callPackage ./flushdns {};
      gitpick = callPackage ./gitpick {};
      yabaictl = callPackage ./yabaictl {};
    })
