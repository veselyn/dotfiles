{ pkgs }:

pkgs.writeShellApplication {
  name = "flushdns";
  text = ''
    dscacheutil -flushcache
    killall -HUP mDNSResponder
  '';
}
