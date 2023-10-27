{
  lib,
  pkgs,
}:
lib.makeScope pkgs.newScope (self:
    with self; {
      battery = callPackage ./battery {};
      flushdns = callPackage ./flushdns {};
      yabaictl = callPackage ./yabaictl {};
      oh-my-zsh = callPackage ./oh-my-zsh.nix {};
    })
