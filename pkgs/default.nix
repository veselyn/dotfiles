{
  lib,
  pkgs,
}:
lib.makeScope pkgs.newScope (self:
    with self; {
      gitpick = callPackage ./gitpick {};
      yabaictl = callPackage ./yabaictl {};
    })
