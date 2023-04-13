{ self, nixpkgs, flake-utils, ... }:

flake-utils.lib.eachDefaultSystemMap (system:
let
  pkgs = import nixpkgs {
    inherit system; overlays = builtins.attrValues self.overlays;
  };
in
{
  battery = pkgs.writeShellApplication {
    name = "battery";
    text = ''
      battery=$(pmset -g batt)
      percentage=$(echo "$battery" | grep -Po '\d{1,3}%')
      echo "$percentage"
    '';
  };
  flushdns = pkgs.writeShellApplication {
    name = "flushdns";
    text = ''
      dscacheutil -flushcache
      killall -HUP mDNSResponder
    '';
  };
}
)
