{
  lib,
  withSystem,
  ...
}: let
  mkPerSystem = systems: f: lib.genAttrs systems (system: withSystem system f);
in {
  flake.lib = {
    mkPerDarwinSystem = mkPerSystem ["aarch64-darwin" "x86_64-darwin"];
    mkPerLinuxSystem = mkPerSystem ["aarch64-linux" "x86_64-linux"];
  };
}
