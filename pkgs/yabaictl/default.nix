{writeShellApplication}:
writeShellApplication {
  name = "yabaictl";
  text = builtins.readFile ./yabaictl.sh;
}
