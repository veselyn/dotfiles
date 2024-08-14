{
  lib,
  pkgs,
}:
lib.makeScope pkgs.newScope (self:
    with self; {
      flushdns = callPackage ./flushdns {};
      gitpick = callPackage ./gitpick {};
      yabaictl = callPackage ./yabaictl {};
    })
