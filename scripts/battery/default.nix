{ pkgs }:

pkgs.writeShellApplication {
  name = "battery";
  text = builtins.readFile ./battery.sh;
}
