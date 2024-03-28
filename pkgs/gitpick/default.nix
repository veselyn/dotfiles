{writeShellApplication}:
writeShellApplication {
  name = "gitpick";
  text = builtins.readFile ./gitpick.sh;
}
