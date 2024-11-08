_: {
  perSystem = {pkgs, ...}: {
    packages.yabaictl = pkgs.writeShellApplication {
      name = "yabaictl";
      text = builtins.readFile ./yabaictl.sh;
    };
  };
}
