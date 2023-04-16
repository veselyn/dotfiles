{ pkgs }:

pkgs.writeShellApplication {
  name = "flushdns";
  text = builtins.readFile ./flushdns.sh;
}
